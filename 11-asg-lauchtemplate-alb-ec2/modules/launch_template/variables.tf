variable "aws_region" {
  default = "us-west-2"
  
}

variable "instance_type" {
  default = "t2.micro"
}

variable "launch_template_name" {}
variable "instance_type" {}
variable "security_group_ids" {
  type = list(string)
}
variable "ami_id" {}


