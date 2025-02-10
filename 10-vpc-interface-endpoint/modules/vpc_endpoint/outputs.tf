# modules/vpc_endpoint/outputs.tf

output "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint."
  value       = aws_vpc_endpoint.ec2_interface.id
}