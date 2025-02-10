provider "aws" {
  region = var.aws_region
  profile = "aws-staging"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Module for ALB
module "alb" {
  source          = "./modules/alb"
  vpc_id          = data.aws_vpc.default.id
  subnet_ids      = data.aws_subnets.default.ids
  alb_sg_name     = "alb-security-group"
  alb_sg_ingress  = [{ from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }]
}

# Module for Launch Template
module "launch_template" {
  source               = "./modules/launch_template"
  instance_type        = "t2.micro"
  security_group_ids   = [module.alb.alb_sg_id]
  ami_id               = data.aws_ami.amazon_linux.id
  launch_template_name = "asg-launch-template"
}

# Module for ASG
module "asg" {
  source               = "./modules/asg"
  subnet_ids           = data.aws_subnets.default.ids
  launch_template_id   = module.launch_template.launch_template_id
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  target_group_arn     = module.alb.target_group_arn
}
