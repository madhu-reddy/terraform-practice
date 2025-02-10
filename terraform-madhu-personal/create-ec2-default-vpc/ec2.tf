resource "aws_instance" "this" {
  ami = data.aws_ami.this.id
  instance_type = "t2.micro"
  user_data = file("userdata.sh")
  tags = {
    Name = "test-instance"
  }
}