# Learning defaults for a single dev environment.
aws_region   = "us-east-1"
environment  = "dev"
project_name = "aws-terraform-github-cicd"

# VPC + subnet CIDR design
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidr_1  = "10.0.1.0/24"
public_subnet_cidr_2  = "10.0.2.0/24"
private_subnet_cidr_1 = "10.0.11.0/24"
private_subnet_cidr_2 = "10.0.12.0/24"

# Choose AZs that exist in your target account/region.
az_1 = "us-east-1a"
az_2 = "us-east-1b"

# IAM defaults
# Leave networking_operator_trusted_principal_arns empty to trust the current AWS account.
networking_operator_trusted_principal_arns = []
networking_operator_max_session_duration   = 3600
flow_logs_log_group_name_prefix            = "/aws/vpc/flow-logs/"
