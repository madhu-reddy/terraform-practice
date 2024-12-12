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
  ami = var.ami[var.environment]
  instance_type = var.types[var.environment]

  tags = {
    name = "example-${var.environment}"
  }
}