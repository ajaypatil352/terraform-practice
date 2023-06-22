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

variable "weighted_rr_sets" {
  description = "A map of region to weight for weighted routing policy."
  type        = map(number)
  default     = {}
}

variable "failover_rr_sets" {
  description = "A map of region to failover type for failover routing policy."
  type        = map(string)
  default     = {}
}

variable "geolocation_rr_sets" {
  description = "A map of location to routing type for geolocation routing policy."
  type        = map(string)
  default     = {}
}


variable "latency_rr_sets" {
  description = "A map of region to latency routing type for latency routing policy."
  type        = map(string)
  default     = {}
}
variable "weighted_routing_policy_enabled" {
  description = "Enable weighted routing policy."
  type        = bool
  default     = false
}

variable "failover_routing_policy_enabled" {
  description = "Enable failover routing policy."
  type        = bool
  default     = false
}

variable "geolocation_routing_policy_enabled" {
  description = "Enable geolocation routing policy."
  type        = bool
  default     = false
}

variable "latency_routing_policy_enabled" {
  description = "Enable latency routing policy."
  type        = bool
  default     = false
}
variable "aws_access_key" {}
variable "aws_secret_key" {}



