# aws-terraform-github-cicd

Practice repo for AWS networking infrastructure with Terraform and GitHub Actions.

## Structure

```text
modules/networking/  Reusable VPC, subnet, internet gateway, and route table module
envs/dev/            Dev environment root configuration
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
