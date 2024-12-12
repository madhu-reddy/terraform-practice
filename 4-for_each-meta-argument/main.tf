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
  for_each = {
    instance1 = "ami-0614680123427b75e"
    instance2 = "ami-053b12d3152c0cc71"
  }

  ami           = each.value
  instance_type = "t2.micro"
  tags = {
    Name = each.key    # instance1, instance2
  }
}

