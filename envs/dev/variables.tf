###############################################
# Dev Environment Variables
###############################################

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project tag value used for all resources"
  type        = string
  default     = "aws-terraform-github-cicd"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_1" {
  description = "First Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "Second Availability Zone"
  type        = string
  default     = "us-east-1b"
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.0.11.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.0.12.0/24"
}

variable "networking_operator_trusted_principal_arns" {
  description = "AWS principal ARNs allowed to assume the networking operator role. Defaults to the current AWS account root principal."
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
