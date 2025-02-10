data "aws_caller_identity" "current" {}

//data "aws_region" "current" {}


data "aws_region" "current" {
    provider = aws.India
}


data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"]  # Owner is Canonical

    filter {
      name  = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    
}

output "aws_calller_identity" {
    value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

output "azs" {
  value = data.aws_availability_zones.available.names
}

