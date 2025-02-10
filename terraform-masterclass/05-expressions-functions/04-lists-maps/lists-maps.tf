locals {
#   users_map = { for user_info in var.users : user_info.username => user_info.role }
#   users_map_1 = { for user_info in var.users : user_info.username => { roles = user_info.role } }
  users_map_ellipse = { for user_info in var.users : user_info.username => user_info.role... }
  users_map2 = { for username, role in local.users_map_ellipse : username => { role = role } } 
  usernames_from_map = [ for username, roles in local.users_map_ellipse : username ]
}

# output "users_map" {
#   value = local.users_map
# }

# output "users_map_1" {
#   value = local.users_map_1
# }

output "user_map_ellipse" {
  value = local.users_map_ellipse
}

output "users_map2" {
  value = local.users_map2
}

output "usernames_from_map" {
  value = local.usernames_from_map
}

/*
Outputs:

users_map = {
  "john" = "admin"
  "mohan" = "tester"
  "raj" = "dev"
}
users_map_1 = {
  "john" = {
    "roles" = "admin"
  }
  "mohan" = {
    "roles" = "tester"
  }
  "raj" = {
    "roles" = "dev"
  }
}

*/



/*

Outputs:

user_map_ellipse = {
  "john" = [
    "admin",
  ]
  "mohan" = [
    "tester",
  ]
  "raj" = [
    "dev",
    "auditor",
  ]
}

users_map2 = {
  "john" = {
    "role" = [
      "admin",
    ]
  }
  "mohan" = {
    "role" = [
      "tester",
    ]
  }
  "raj" = {
    "role" = [
      "dev",
      "auditor",
    ]
  }
}

usernames_from_map = [
  "john",
  "mohan",
  "raj",
]


*/

/*
In Terraform, the ellipsis (...)  feature enables grouping of values by a common key, resulting in a map where each key corresponds to a list of items.
*/
