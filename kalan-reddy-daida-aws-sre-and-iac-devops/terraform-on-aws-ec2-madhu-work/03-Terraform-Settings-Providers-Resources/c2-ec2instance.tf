resource "aws_instance" "myec2vm" {
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh")
  key_name = "madhu-key"
  tags = {
    "Name" = "EC2 Demo"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "madhu-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqoFH2xJjLAt9nnHVCCDgp4P5xiz6Xms0gUe7ipvWzv/bShffRuesjZK+tWD36JNhLLUshZCQ4rZuOKItx2AKIz845mon1c9CT+WmpexoasA0zL6JJywPItzBvZRHFEK7RvYjhomwaSPKIVDrE5o1RPfNBIEkObfWPMWR9Sip/rgDdBl646FKLU/8epMHzwKyhgi57AJoTnASbojwSNMROtdDEf2yOUogQpbAJJR+LsSJMxC0F2devZahMxs/xW61LIg309WBMCtxeEkdsovq8nM4XnlusdekgnwrBMYO2IqttKhUo5t4qeo9G+ps11MbmWNn/hjk9ER93JeqTKh58ZdNy9nXo0DICV4DqXRYFkEBSJlktxsLpUxlBl2wgNDfrvUGYzOSksOR9gKW98gSTwEf2R2AmAdJMc635HvrElwomRD2iDvgxQTFkDPBgvSpuSUy4J/M9VDtDQzzCF0t4JlyuPNKznTXnEjlo+JufMdNERcvaaRvZm0oV8MuaYBs= root@madhu-Latitude-5400"

}