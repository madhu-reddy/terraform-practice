output "vpc_id" {
  value = module.vpc.vpc_id
}

output "iam_role" {
  value = module.iam.role_name
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}