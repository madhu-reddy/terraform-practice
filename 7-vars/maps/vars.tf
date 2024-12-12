variable "ami" {
  type = map(string)
  default  = {
    "production" = "ami-0614680123427b75e"
    "staging" = "ami-053b12d3152c0cc71"
  }
}

variable "types" {
  type = map(string)
  default  = {
    "production" = "t3.micro"
    "staging" = "t2.micro"
  }
}

variable "environment" {
  type = string
  default = "staging"
}