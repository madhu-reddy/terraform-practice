# output "instances" {
#   value = aws_instance.example
# }

output "instance_ids" {
  value = aws_instance.example[*].id
}

# Output mapping of instances to subnets
output "instancename_subnet_mapping" {
  value = {
    for instance in aws_instance.example :
    instance.tags["Name"] => instance.subnet_id
  }
}


output "instanceid_subnet_mapping" {
  value = {
    for instance in aws_instance.example :
    instance.id => instance.subnet_id
  }
}