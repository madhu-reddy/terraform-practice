variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

# variable "public_subnet_id" {
#   description = "ID of the public subnet"
# }

# variable "private_subnet_id" {
#   description = "ID of the private subnet"
# }

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type = string
  default = null
  
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type = string
  default = null  
}

variable "security_group_id" {
  description = "Security group ID"
}

variable "iam_instance_profile" {
  description = "IAM instance profile for EC2"
}

variable "key_name" {
  description = "The SSH key name to use for EC2 instances"
  default = "madhu-key"
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Staging"
    "Owner"       = "TeamA"
  }
}