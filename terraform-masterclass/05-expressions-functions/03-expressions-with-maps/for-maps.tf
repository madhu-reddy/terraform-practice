locals {
  doubles_map = { for key, value in var.numbers_map : key => value * 2}
  even_map = { for key, value in var.numbers_map : key => value if value % 2 == 0}
}

output "doubles_map" {
  value = local.doubles_map
}

output "even_map" {
  value = local.even_map
}


/*

Outputs:

doubles_map = {
  "five" = 10
  "four" = 8
  "one" = 2
  "three" = 6
  "two" = 4
}
even_map = {
  "four" = 4
  "two" = 2
}

*/

