output "public_instance_ip" {
  value = module.ec2.public_instance_ip
}

output "private_instance_id" {
  value = module.ec2.private_instance_id
}

output "vpc_endpoint_id" {
  value = module.vpc.s3_vpc_endpoint_id
}