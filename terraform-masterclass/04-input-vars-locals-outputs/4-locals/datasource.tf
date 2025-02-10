locals {
  project_owner = "terraform-course"
  cost_center   = "1234"
  managed_by    = "Terraform"
}

locals {
  common_tags = {
    project_owner = local.project_owner
    cost_center = local.cost_center
    managed_by = local.managed_by
  }
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"]  # Owner is Canonical

    filter {
      name  = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    
}