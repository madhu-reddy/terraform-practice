variable "instance_types" {
  type = list(string)
  default = ["t2.micro", "t3.micro", "t2.medium"]
}

variable "AMI" {
  type = list(string)
  default = ["ami-0614680123427b75e", "ami-053b12d3152c0cc71"]
  
}

