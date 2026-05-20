###############################################
# Input Variables
#
# These values make your Terraform code configurable
# without changing resource blocks directly.
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
  description = "Environment name (dev, stage, prod, etc.)"
  type        = string
  default     = "dev"
}

# VPC CIDR range (large enough to split into multiple subnets)
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Availability Zones to spread subnets across for resilience
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

# Public subnet CIDRs (instances here can get public IPs)
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

# Private subnet CIDRs (no public IPs by default)
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
