locals {
  users_from_yaml = yamldecode(file("${path.module}/users-roles.yaml"))
}


resource "aws_iam_user" "users" {
  for_each = toset(local.users_from_yaml.users[*].username)
  #for_each = toset([for user in local.users_from_yaml.users : user.username])
  name = each.value
}

resource "aws_iam_user_login_profile" "users" {
  for_each = aws_iam_user.users
  user = each.value.name
  password_length = 8

  lifecycle {
    ignore_changes = [ 
      password_length,
      password_reset_required,
      pgp_key
     ]
  }


}

output "users" {
  value = local.users_from_yaml

}

output "users_list" {
  value = local.users_from_yaml.users

}

output "passwords" {
  value = { for user, user_login in aws_iam_user_login_profile.users : user => nonsensitive(user_login.password) }
}
