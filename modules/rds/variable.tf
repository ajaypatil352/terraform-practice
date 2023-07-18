variable "allocated_storage"{
  type        = number
  description = "this is allocated_storage"
}

variable "db_name"{
  type        = string
  description = "this is db name"
}
variable "engine"{
  type        = string
  description = "this version of db"
}

variable "engine_version"{
  type        = number
  description = "this is engine version"
}
variable "instance_class"{
  type        = string
  description = "this is instance class"
}
variable "username"{
  type        = string
  description = "this user name"
}
variable "password"{
  type        = string
  description = "this is password"
}
variable "parameter_group_name"{
  type        = string
  description = "this is parameter group"
}



