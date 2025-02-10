# modules/vpc_endpoint/variables.tf

variable "vpc_id" {
  description = "The VPC ID to create the VPC endpoint in."
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the VPC endpoint."
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the VPC endpoint."
  type        = list(string)
}
