###############################################
# Dev Environment
#
# This root module wires environment-specific values into
# reusable modules.
###############################################

module "networking" {
  source = "../../modules/networking"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr
  az_1     = var.az_1
  az_2     = var.az_2

  public_subnet_cidr_1  = var.public_subnet_cidr_1
  public_subnet_cidr_2  = var.public_subnet_cidr_2
  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_cidr_2 = var.private_subnet_cidr_2
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

  networking_operator_trusted_principal_arns = var.networking_operator_trusted_principal_arns
  networking_operator_max_session_duration   = var.networking_operator_max_session_duration
  flow_logs_log_group_name_prefix            = var.flow_logs_log_group_name_prefix
}
