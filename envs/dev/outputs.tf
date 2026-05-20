###############################################
# Dev Environment Outputs
###############################################

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.networking.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = module.networking.internet_gateway_id
}

output "public_route_table_id" {
  description = "Route table ID for public subnets"
  value       = module.networking.public_route_table_id
}

output "private_route_table_id" {
  description = "Route table ID for private subnets"
  value       = module.networking.private_route_table_id
}
