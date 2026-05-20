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
