variable "objects_list" {
  type = list(object({
    firstname = string
    lastname  = string
  }))
}

variable "users" {
  type = list(object({
    username = string
    role     = string
  }))
}