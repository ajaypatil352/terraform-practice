variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "internal_alb" {
  description = "Specify if the Application Load Balancer is internal or external"
  type        = bool
}

variable "load_balancer_type" {
  description = "Type of load balancer"
  type        = string
}

variable "security_groups_ids" {
  description = "List of security group IDs associated with the Application Load Balancer"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Application Load Balancer"
  type        = list(string)
}

variable "idle_timeout" {
  description = "Idle timeout value for the Application Load Balancer"
  type        = number
}

variable "alb_tags" {
  description = "Tags to assign to the Application Load Balancer"
  type        = map(string)
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port number for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol to use for the target group"
  type        = string
}

variable "target_group_vpc_id" {
  description = "ID of the VPC in which the target group should be created"
  type        = string
}

variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
}

variable "listener_port" {
  description = "Port number for the ALB listener"
  type        = number
}

variable "listener_portocol" {
  description = "Protocol to use for the ALB listener"
  type        = string
}

#variable "ssl_policy" {
  description = "SSL policy for the ALB listener"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate"
  type        = string
}

variable "listener_routing_type" {
  description = "Type of routing action for the ALB listener"
  type        = string
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
