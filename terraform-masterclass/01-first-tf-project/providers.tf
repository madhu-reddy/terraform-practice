terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }

  }
  required_version = ">= 1.2.0"
}


provider "aws" {
  region  = "ap-south-1"
  profile = "madhu-staging"
}


resource "random_id" "bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-${random_id.bucket_suffix.hex}"
  
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}