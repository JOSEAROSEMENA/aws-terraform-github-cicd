###############################################
# IAM Resources
#
# This module creates a small set of roles useful for
# networking operations and VPC Flow Logs delivery.
###############################################

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

locals {
  trusted_principal_arns = length(var.networking_operator_trusted_principal_arns) > 0 ? var.networking_operator_trusted_principal_arns : [
    "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"
  ]

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################
# Networking Operator Role
###############################################
data "aws_iam_policy_document" "networking_operator_assume_role" {
  statement {
    sid     = "AllowTrustedPrincipalsToAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = local.trusted_principal_arns
    }
  }
}

resource "aws_iam_role" "networking_operator" {
  name                 = "${var.project_name}-${var.environment}-networking-operator"
  description          = "Role for inspecting network resources and managing VPC Flow Logs"
  assume_role_policy   = data.aws_iam_policy_document.networking_operator_assume_role.json
  max_session_duration = var.networking_operator_max_session_duration

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-networking-operator"
  })
}

data "aws_iam_policy_document" "networking_operator" {
  statement {
    sid    = "AllowNetworkReadOnlyAccess"
    effect = "Allow"

    actions = [
      "ec2:Describe*",
      "elasticloadbalancing:Describe*",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogEvents"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowVpcFlowLogManagement"
    effect = "Allow"

    actions = [
      "ec2:CreateFlowLogs",
      "ec2:DeleteFlowLogs",
      "ec2:DescribeFlowLogs"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowFlowLogGroupManagement"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:PutRetentionPolicy",
      "logs:TagResource"
    ]

    resources = [
      "arn:${data.aws_partition.current.partition}:logs:*:${data.aws_caller_identity.current.account_id}:log-group:${var.flow_logs_log_group_name_prefix}*"
    ]
  }

  statement {
    sid     = "AllowPassingFlowLogsPublisherRole"
    effect  = "Allow"
    actions = ["iam:PassRole"]

    resources = [aws_iam_role.vpc_flow_logs_publisher.arn]

    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "networking_operator" {
  name        = "${var.project_name}-${var.environment}-networking-operator"
  description = "Permissions for inspecting network resources and managing VPC Flow Logs"
  policy      = data.aws_iam_policy_document.networking_operator.json

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-networking-operator"
  })
}

resource "aws_iam_role_policy_attachment" "networking_operator" {
  role       = aws_iam_role.networking_operator.name
  policy_arn = aws_iam_policy.networking_operator.arn
}

###############################################
# VPC Flow Logs Publisher Role
###############################################
data "aws_iam_policy_document" "vpc_flow_logs_assume_role" {
  statement {
    sid     = "AllowVpcFlowLogsServiceToAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "vpc_flow_logs_publisher" {
  name               = "${var.project_name}-${var.environment}-vpc-flow-logs-publisher"
  description        = "Service role used by VPC Flow Logs to publish to CloudWatch Logs"
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_assume_role.json

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-vpc-flow-logs-publisher"
  })
}

data "aws_iam_policy_document" "vpc_flow_logs_publisher" {
  statement {
    sid    = "AllowPublishingVpcFlowLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:${data.aws_partition.current.partition}:logs:*:${data.aws_caller_identity.current.account_id}:log-group:${var.flow_logs_log_group_name_prefix}*",
      "arn:${data.aws_partition.current.partition}:logs:*:${data.aws_caller_identity.current.account_id}:log-group:${var.flow_logs_log_group_name_prefix}*:log-stream:*"
    ]
  }
}

resource "aws_iam_role_policy" "vpc_flow_logs_publisher" {
  name   = "${var.project_name}-${var.environment}-vpc-flow-logs-publisher"
  role   = aws_iam_role.vpc_flow_logs_publisher.id
  policy = data.aws_iam_policy_document.vpc_flow_logs_publisher.json
}
