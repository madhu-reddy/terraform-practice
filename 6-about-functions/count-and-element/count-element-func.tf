terraform {
	required_providers {
	  aws = {
		source  = "hashicorp/aws"
		version = "~> 4.16"
	  }
	}
	required_version = ">= 1.2.0"
}
  
provider "aws" {
	region  = "ap-south-1"
	profile = "aws-madhu"
}


resource "aws_instance" "example" {
	count         = length(data.aws_subnets.default_vpc_subnets.ids)  # One instance per subnet
	ami           = "ami-0614680123427b75e"
	instance_type = "t3.micro"
	subnet_id     = element(data.aws_subnets.default_vpc_subnets.ids, count.index)
  
	tags = {
	  Name   = "instance-${count.index}"
	  Subnet = element(data.aws_subnets.default_vpc_subnets.ids, count.index)
	}
  }
  