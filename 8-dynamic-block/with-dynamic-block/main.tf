# main.tf
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
	profile = "aws-staging"
}


resource "aws_vpc" "sandbox_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sandbox_vpc"
  }
}

resource "aws_subnet" "sandbox_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sandbox_subnet"
  }
}

resource "aws_security_group" "sandbox_sg" {
  name   = "sandbox_sg"
  vpc_id = aws_vpc.sandbox_vpc.id

  dynamic "ingress" {
    for_each = var.settings
    iterator = sandbox_sg_ingress

    content {
      description = sandbox_sg_ingress.value["description"]
      from_port   = sandbox_sg_ingress.value["port"]
      to_port     = sandbox_sg_ingress.value["port"]
      protocol    = "tcp"
      cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
    }
  }

  tags = {
    Name = "sandbox_sg"
  }
}


/*
The iterator name is sandbox_sg_ingress. 
This is used to represent the current element of var.settings being iterated over. 
If the iterator name (i.e., sandbox_sg_ingress) is not specified, then the label of the dynamic block (i.e., ingress) will be used as the iterator.
*/

