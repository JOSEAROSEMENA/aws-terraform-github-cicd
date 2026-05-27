###############################################
# IAM Module Outputs
###############################################

output "networking_operator_role_name" {
  description = "Name of the networking operator IAM role"
  value       = aws_iam_role.networking_operator.name
}

output "networking_operator_role_arn" {
  description = "ARN of the networking operator IAM role"
  value       = aws_iam_role.networking_operator.arn
}

output "networking_operator_policy_arn" {
  description = "ARN of the networking operator IAM policy"
  value       = aws_iam_policy.networking_operator.arn
}

output "vpc_flow_logs_publisher_role_name" {
  description = "Name of the VPC Flow Logs publisher IAM role"
  value       = aws_iam_role.vpc_flow_logs_publisher.name
}

output "vpc_flow_logs_publisher_role_arn" {
  description = "ARN of the VPC Flow Logs publisher IAM role"
  value       = aws_iam_role.vpc_flow_logs_publisher.arn
}
