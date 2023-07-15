variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-bucket1507"
}

variable "bucket_acl" {
  description = "ACL for the S3 bucket"
  type        = string
  default     = "public"
}

variable "versioning_status" {
  description = "Status of bucket versioning"
  type        = string
  default     = "Enabled"
}
