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
	profile = "aws-madhu"
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

  ingress {
    description = "Allows SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
  }

  ingress {
    description = "Allows HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
  }

  ingress {
    description = "Allows HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.sandbox_vpc.cidr_block]
  }

  # more ingress rules here...

  tags = {
    Name = "sandbox_sg"
  }
}