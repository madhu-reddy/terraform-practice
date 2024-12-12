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
    count = length(var.instance_types)
    instance_type = var.instance_types[count.index]
    ami = length(var.AMI) > count.index ? var.AMI[count.index] : var.AMI[0]
    
    tags = {
	  Name   = "instance-${count.index}"
    }

}
