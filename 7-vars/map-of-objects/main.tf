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
  for_each = {
    for k, v in var.instance_configs :
    k => v
  }

  ami           = each.value.ami
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }
}