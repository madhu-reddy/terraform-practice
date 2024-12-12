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




resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


module "webserver-dave" {
  source         = "../modules/webserver"
  vpc_id         = aws_vpc.main.id
  cidr_block     = "10.0.0.0/24"
  ami            = "ami-0614680123427b75e"
  instance_type  = var.instance
  webserver_name = "Madhu user 2"
}
  