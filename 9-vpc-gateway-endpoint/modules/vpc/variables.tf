variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone_public" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "availability_zone_private" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}
