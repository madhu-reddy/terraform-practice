variable "subnet_config" {
  type    = map(object({
    cidr_block = string 

  }))
  # Ensure all provided CIDR blocks are valid
  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "Atleast one of the provided CIDR blocks is not valid"
  }
}

variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))
}


variable "ec2_instance_config_map" {
  type = map(object({
    instance_type = string
    ami           = string
    subnet_name = optional(string, "default")
  }))

  validation {
    //condition = alltrue([for key, config in var.ec2_instance_config_map : contains(["nginx", "ubuntu"], config.ami)])
    condition = alltrue([for config in values(var.ec2_instance_config_map) : contains(["nginx", "ubuntu"], config.ami)])
    error_message = "Allowed \"ami\" values: \"ubuntu\", \"nginx\"."
  }

  validation {
    condition = alltrue([for key, config in var.ec2_instance_config_map : contains(["t2.micro"], config.instance_type)])    
    error_message = "Only t2.micro instances are allowed"
  }
}