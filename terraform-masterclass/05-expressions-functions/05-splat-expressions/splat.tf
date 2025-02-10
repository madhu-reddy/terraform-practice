locals {
  users_map_ellipse = { for user_info in var.users : user_info.username => user_info.role... }
  users_map2 = { for username, role in local.users_map_ellipse : username => { role = role } }
}

locals {
  firstnames_from_splat = var.objects_list[*].firstname
  roles_from_splat = values(local.users_map2)[*].role
}

output "firstnames_from_splat" {
  value = local.firstnames_from_splat
}

output "users_map2" {
  value = local.users_map2
}

output "roles_from_splat" {
  value = local.roles_from_splat
}