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

output "networking_operator_role_arn" {
  description = "ARN of the networking operator IAM role"
  value       = module.iam.networking_operator_role_arn
}

output "networking_operator_policy_arn" {
  description = "ARN of the networking operator IAM policy"
  value       = module.iam.networking_operator_policy_arn
}

output "vpc_flow_logs_publisher_role_arn" {
  description = "ARN of the VPC Flow Logs publisher IAM role"
  value       = module.iam.vpc_flow_logs_publisher_role_arn
}
