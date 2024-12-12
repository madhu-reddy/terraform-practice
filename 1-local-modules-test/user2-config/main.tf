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
  region  = "us-east-1"
  profile = "aws-madhu"
}


resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
}


module "webserver-madhu" {
  source     = "../modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.1.0/24"
  ami        = "ami-053b0d53c279acc90"
  instance_type  = "t3.micro"
  webserver_name = "Madhu's"
}
