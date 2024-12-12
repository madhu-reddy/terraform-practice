output "instance_ids" {
  value = [for instance in aws_instance.example : instance.id]
}


# output "instance" {
#   value = [for instance in aws_instance.example : instance]
# }

output "instance" {
  value = aws_instance.example
}