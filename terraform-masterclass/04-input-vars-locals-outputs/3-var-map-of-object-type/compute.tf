resource "aws_instance" "compute" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.defaultvalues.size
    volume_type           = var.ec2_volume_config.defaultvalues.type
  }
}

