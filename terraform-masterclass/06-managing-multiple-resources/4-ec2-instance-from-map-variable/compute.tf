# resource "aws_instance" "from_list" {
#   count         = length(var.ec2_instance_config_list)
#   #ami           = data.aws_ami.ubuntu.id
#   ami   = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
#   //instance_type = "t2.micro"
#   instance_type = var.ec2_instance_config_list[count.index].instance_type
#   //subnet_id = aws_subnet.main[0].id
#   subnet_id = aws_subnet.main[count.index % length(aws_subnet.main)].id

#   tags = {
#     Name    = "${local.project}-${count.index}"
#     Project = local.project
#   }

# }


resource "aws_instance" "from_map" {
  # each.key  => holds the key of each key-value pair in the map
  # each.value => holds the value of each key-value pair in the map the map
  for_each         = var.ec2_instance_config_map
  ami   = local.ami_ids[each.value.ami]
  instance_type = each.value.instance_type
  subnet_id = aws_subnet.main[each.value.subnet_index].id

  tags = {
    Name    = "${local.project}-${each.key}"
    Project = local.project
  }

}
