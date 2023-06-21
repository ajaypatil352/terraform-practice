variable "domain_name" {
  description = "The domain name for the hosted zone"
  type        = string
  default     = "abc.com"
}

variable "routing_policy_type" {
  description = "The type of routing policy"
  type        = string
  default     = "weighted"  # Specify the desired routing policy type here (weighted, failover, geolocation, latency)
}

variable "record_name" {
  description = "The name for the DNS record"
  type        = string
  default     = "abcd.com"
}

variable "weighted_routing_policy" {
  description = "The weighted routing policy configuration"
  type        = object({
    weight     = number
    set_id     = string
  })
  default     = null
}

variable "failover_routing_policy" {
  description = "The failover routing policy configuration"
  type        = object({
    set_id        = string
    health_check  = string
    failover_type = string
  })
  default     = null
}

variable "geolocation_routing_policy" {
  description = "The geolocation routing policy configuration"
  type        = object({
    set_id       = string
    country_code = string
  })
  default     = null
}

variable "latency_routing_policy" {
  description = "The latency routing policy configuration"
  type        = object({
    set_id       = string
    region       = string
  })
  default     = null
}
variable "aws_access_key" {}
variable "aws_secret_key" {}



