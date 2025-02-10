variable "aws_region" {
  default = "us-west-2"
  
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_ids" {}
variable "launch_template_id" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "target_group_arn" {}
