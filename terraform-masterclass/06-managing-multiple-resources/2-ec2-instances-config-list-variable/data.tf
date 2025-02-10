data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Owner is Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_ami" "nginx" { 
  most_recent = true
  owners      = ["679593333241"] # Owner is Bitnami
  filter {
    name   = "name"
    values = ["bitnami-nginx-1.27.3-*-linux-debian-12-x86_64-hvm-ebs-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

locals {
  project = "multiple-resources"
}

locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id
    nginx = data.aws_ami.nginx.id
  }
}