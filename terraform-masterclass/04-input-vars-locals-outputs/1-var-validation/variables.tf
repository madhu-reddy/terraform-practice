variable "ec2_instance_type" {
  type = string
  //default = "t2.micro"

  validation {
    condition = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "Only supports t2.micro and t3.micro"
  }
}

variable "ec2_volume_size" {
  type = string
}

variable "ec2_volume_type" {
  type = string
}