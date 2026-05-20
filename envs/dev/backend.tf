terraform {
  backend "s3" {
    bucket       = "aws-terraform-github-cicd-tfstate-josearosemena"
    encrypt      = true
    key          = "aws-terraform-github-cicd/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
