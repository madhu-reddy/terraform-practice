provider "aws" {
  region = var.aws_region
  profile = "aws-staging"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "192.168.0.0/20"
  public_subnet_cidr = "192.168.1.0/24"  # Public subnet CIDR
  private_subnet_cidr = "192.168.2.0/24" # Private subnet CIDR
}

module "iam" {
  source = "./modules/iam"
  instance_role_name = "ec2-role"
}

module "ec2_public" {
  source               = "./modules/ec2"
  #private_subnet_id            = module.vpc.public_subnet_id  # Reference the public subnet
  public_subnet_id            = module.vpc.public_subnet_id  # Reference the private subnet
  security_group_id    = module.vpc.ec2_sg_id
  iam_instance_profile = module.iam.instance_profile_name
  ami_id               = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  key_name             = module.key_pair.key_name
  tags = {
    Name = "Public EC2 Instance"
  }
}

module "ec2_private" {
  source               = "./modules/ec2"
  #public_subnet_id            = module.vpc.public_subnet_id  # Reference the private subnet
  private_subnet_id            = module.vpc.private_subnet_id  # Reference the public subnet
  security_group_id    = module.vpc.ec2_sg_id
  iam_instance_profile = module.iam.instance_profile_name
  ami_id               = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  key_name             = module.key_pair.key_name
  tags = {
    Name = "Private EC2 Instance"
  }
}

module "vpc_endpoint" {
  source = "./modules/vpc_endpoint"

  vpc_id             = module.vpc.vpc_id
  region             = var.aws_region
  subnet_ids         = [module.vpc.private_subnet_id]
  security_group_ids = [module.vpc.ec2_sg_id]
}


module "key_pair" {
  source = "./modules/key_pair"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}