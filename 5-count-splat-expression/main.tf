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


resource "aws_instance" "example" {
  count         = length(var.instances)
  ami           = var.instances[count.index].ami
  instance_type = "t2.micro"
  tags = {
    Name = var.instances[count.index].name
  }
}