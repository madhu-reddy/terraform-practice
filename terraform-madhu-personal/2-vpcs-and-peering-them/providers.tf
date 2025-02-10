terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the ue-east-1 AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure the ue-east-2 AWS Provider
provider "aws" {
  alias = "east2"
  region = "us-east-2"
}