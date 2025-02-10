provider "aws" {
  region = var.aws_region
  profile = "aws-staging"
}

resource "aws_launch_template" "lt" {
  name          = var.launch_template_name
  instance_type = var.instance_type

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      volume_size           = 8
      volume_type           = "gp2"
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  image_id = var.ami_id
}
