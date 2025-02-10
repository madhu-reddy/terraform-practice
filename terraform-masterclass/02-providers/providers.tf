terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  profile = "madhu-staging"
}

provider "aws" {
    region = "us-east-2"
    alias = "useast2"
    profile = "madhu-staging"
  
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "testddffaaaaa"  
}


resource "aws_s3_bucket" "my_bucket_us_east_2" {
    bucket = "testddffaaaaaus-east-2"  
    provider = aws.useast2
}
