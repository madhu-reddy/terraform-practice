resource "aws_key_pair" "main" {
  key_name   = "my-ec2-key"
  public_key = file("/root/.ssh/id_rsa.pub") # Path to your public key file

  tags = {
    Name = "EC2-KeyPair"
  }
}

output "key_name" {
  value = aws_key_pair.main.key_name
}