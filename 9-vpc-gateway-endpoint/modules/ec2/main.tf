resource "aws_key_pair" "example" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "public_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = aws_key_pair.example.key_name
  associate_public_ip_address = true

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  key_name      = aws_key_pair.example.key_name
  associate_public_ip_address = false

  tags = {
    Name = "PrivateInstance"
  }
}
