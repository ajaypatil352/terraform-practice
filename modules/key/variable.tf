variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
  default     = "my-key-pair"
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

