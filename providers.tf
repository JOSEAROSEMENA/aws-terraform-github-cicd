###############################################
# Terraform + Provider Configuration
#
# This file defines:
# 1) The minimum Terraform CLI version expected.
# 2) The AWS provider and a pinned version constraint.
# 3) The AWS region used for all resources in this project.
###############################################
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Region is kept as a variable so you can reuse the same code
  # in different AWS regions without editing this file.
  region = var.aws_region
}
