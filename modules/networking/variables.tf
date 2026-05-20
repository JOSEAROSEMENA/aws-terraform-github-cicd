###############################################
# Networking Module Variables
###############################################

variable "project_name" {
  description = "Project tag value used for all resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod, etc.)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "az_1" {
  description = "First Availability Zone"
  type        = string
}

variable "az_2" {
  description = "Second Availability Zone"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for private subnet 2"
  type        = string
}
