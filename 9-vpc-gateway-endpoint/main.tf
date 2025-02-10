provider "aws" {
  region  = "us-west-2"
  profile = "aws-staging"
  
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  availability_zone_public   = "us-west-2a"
  availability_zone_private   = "us-west-2b"
  region               = "us-west-2"
}

module "ec2" {
  source = "./modules/ec2"

  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  key_name          = var.key_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
}
