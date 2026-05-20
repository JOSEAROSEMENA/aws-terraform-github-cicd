###############################################
# Bootstrap Variables
###############################################

variable "aws_region" {
  description = "AWS region where the Terraform state bucket will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project tag value used for bootstrap resources"
  type        = string
  default     = "aws-terraform-github-cicd"
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform remote state"
  type        = string
}
