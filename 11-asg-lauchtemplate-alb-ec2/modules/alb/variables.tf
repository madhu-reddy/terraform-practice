variable "vpc_id" {}
variable "subnet_ids" {}
variable "alb_sg_name" {}
variable "alb_sg_ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
