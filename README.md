# aws-terraform-github-cicd

Practice repo for AWS networking and IAM infrastructure with Terraform and GitHub Actions.

## Structure

```text
bootstrap/backend/   One-time S3 bucket bootstrap for Terraform remote state
modules/networking/  Reusable VPC, subnet, internet gateway, and route table module
modules/iam/         Reusable IAM roles and policies for networking operations
envs/dev/            Dev environment root configuration
```

## What It Builds

The dev environment currently provisions:

- A VPC across two Availability Zones
- Two public subnets and two private subnets
- An internet gateway and public/private route tables
- A networking operator IAM role for network inspection and VPC Flow Logs management
- A VPC Flow Logs publisher IAM role that can write flow logs to CloudWatch Logs

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

Useful outputs include the VPC ID, subnet IDs, route table IDs, networking operator role ARN, and VPC Flow Logs publisher role ARN.

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
