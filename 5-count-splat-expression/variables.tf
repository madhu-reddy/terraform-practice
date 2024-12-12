variable "instances" {
  default = [
    {
      name = "instance1"
      ami  = "ami-0614680123427b75e"
    },
    {
      name = "instance2"
      ami  = "ami-053b12d3152c0cc71"
    }
  ]
}
