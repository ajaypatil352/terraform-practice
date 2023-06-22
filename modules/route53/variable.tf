variable "domain_name" {
  description = "The domain name for the Route 53 zone."
  type        = string
  default     = "example.com"
}

variable "record_name" {
  description = "The name of the Route 53 record."
  type        = string
  default     = "example-record"
}


variable "routing_policy_type" {
  description = "The type of routing policy to use."
  type        = string
  default     = "weighted"
  validation {
    condition     = can(regex("^weighted$|^failover$|^geolocation$|^latency$|^alias$", var.routing_policy_type))
    error_message = "Invalid routing_policy_type. Valid values are 'weighted', 'failover', 'geolocation', 'latency', or 'alias'."
  }
}

variable "weighted_routing_policy" {
  description = "Configuration for the weighted routing policy."
  type        = object({
    weight = number
  })
  default     = {
    set_identifier  = "dev"
    records         = ["dev.example.com"]
    weight = 50
  }
}

variable "failover_routing_policy" {
  description = "Configuration for the failover routing policy."
  type        = object({
  
     type           = string
    #set_identifier  = string
   # records         = list(string)
  })
  default     = {
     type            = "PRIMARY"
    #set_identifier  = "dev"
    #records         = ["dev.example.com"]
  }
}

variable "geolocation_routing_policy" {
  description = "Configuration for the geolocation routing policy."
  type        = object({
    country_code = string
  })
  default     = {
    country_code = "US"
  }
}

variable "latency_routing_policy" {
  description = "Configuration for the latency routing policy."
  type        = object({
    region = string
  })
  default     = {
    region = "us-east-1"
  }
}
variable "aws_access_key" {}
variable "aws_secret_key" {}
