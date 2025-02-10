resource "aws_instance" "from_list" {
  count         = length(var.ec2_instance_config_list)
  #ami           = data.aws_ami.ubuntu.id
  ami   = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
  //instance_type = "t2.micro"
  instance_type = var.ec2_instance_config_list[count.index].instance_type
  //subnet_id = aws_subnet.main[0].id
  subnet_id = aws_subnet.main[count.index % length(aws_subnet.main)].id

  tags = {
    Name    = "${local.project}-${count.index}"
    Project = local.project
  }

}

