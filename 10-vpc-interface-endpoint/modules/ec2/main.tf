resource "aws_instance" "this" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.public_subnet_id != null ? var.public_subnet_id : var.private_subnet_id  # Determine the subnet dynamically
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile = var.iam_instance_profile
  key_name             = var.key_name  # Associate key pair with the instance
  tags                  = var.tags
}
