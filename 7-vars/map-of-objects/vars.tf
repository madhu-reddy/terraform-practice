variable "instance_configs" {
  type = map(object({
    instance_type = string
    ami           = string
  }))
  default = {
    web = {
      instance_type = "t2.micro"
      ami           = "ami-0614680123427b75e"
    }
    db = {
      instance_type = "t3.medium"
      ami           = "ami-053b12d3152c0cc71"
    }
  }
}