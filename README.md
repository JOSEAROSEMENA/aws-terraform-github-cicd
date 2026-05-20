# aws-terraform-github-cicd

Practice repo for AWS networking infrastructure with Terraform and GitHub Actions.

## Structure

```text
bootstrap/backend/   One-time S3 bucket bootstrap for Terraform remote state
modules/networking/  Reusable VPC, subnet, internet gateway, and route table module
envs/dev/            Dev environment root configuration
```

## Backend Bootstrap

Create the remote state bucket before configuring `envs/dev` to use it:

```bash
cd bootstrap/backend
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars and choose a globally unique state_bucket_name.
terraform init
terraform apply
```

## Dev commands

Run Terraform from the environment folder:

```bash
cd envs/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

## GitHub Actions

This repo includes two Terraform workflows:

```text
.github/workflows/terraform-pr.yml    Runs fmt, init, validate, and plan on pull requests
.github/workflows/terraform-main.yml  Runs fmt, init, validate, plan, and apply on main
```

The workflows expect GitHub Actions to assume an AWS IAM role through OIDC. Add this repository secret after creating the role in AWS:

```text
AWS_GITHUB_ACTIONS_ROLE_ARN
```

The main workflow targets the `dev` GitHub Environment. Configure that environment in GitHub if you want a manual approval gate before `terraform apply`.
