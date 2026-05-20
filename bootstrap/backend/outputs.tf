###############################################
# Bootstrap Outputs
###############################################

output "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform remote state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "state_bucket_arn" {
  description = "ARN of the S3 bucket for Terraform remote state"
  value       = aws_s3_bucket.terraform_state.arn
}

output "dev_backend_config" {
  description = "Backend configuration values to use in envs/dev/backend.tf"
  value = {
    bucket       = aws_s3_bucket.terraform_state.bucket
    key          = "aws-terraform-github-cicd/dev/terraform.tfstate"
    region       = var.aws_region
    encrypt      = true
    use_lockfile = true
  }
}
