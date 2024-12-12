data "aws_vpc" "default" {
  default = true
}


# Fetch Subnets in the Default VPC
data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}