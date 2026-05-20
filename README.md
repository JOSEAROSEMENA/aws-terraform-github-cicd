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
