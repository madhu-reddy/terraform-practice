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
  region = "ap-south-1"
  profile = "madhu-staging"
  alias = "India"
}