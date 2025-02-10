variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID for the public instance"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID for the private instance"
  type        = string
}
