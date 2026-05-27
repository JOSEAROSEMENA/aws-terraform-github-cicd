###############################################
# IAM Module Variables
###############################################

variable "project_name" {
  description = "Project tag value used for all resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod, etc.)"
  type        = string
}

variable "networking_operator_trusted_principal_arns" {
  description = "AWS principal ARNs allowed in the networking operator role trust policy. Defaults to the current AWS account root principal."
  type        = list(string)
  default     = []
}

variable "networking_operator_max_session_duration" {
  description = "Maximum session duration, in seconds, for the networking operator role"
  type        = number
  default     = 3600
}

variable "flow_logs_log_group_name_prefix" {
  description = "CloudWatch Logs log group name prefix the IAM policies allow for VPC Flow Logs"
  type        = string
  default     = "/aws/vpc/flow-logs/"
}
