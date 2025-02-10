variable "key_name" {
  description = "Name of the key pair to use for EC2 instances"
  type        = string
  default = "madhu-key"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-07d9cf938edb0739b"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}
