variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-cluster"
}

variable "task_definition_family" {
  description = "Family of the ECS task definition"
  type        = string
  default     = "my-task-def"
}

variable "execution_role_arn" {
  description = "ARN of the execution role"
  type        = string
  default     = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
}

variable "container_image" {
  description = "Container image to use"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Container port to expose"
  type        = number
  default     = 80
}

variable "cpu_units" {
  description = "CPU units for the task"
  type        = number
  default     = 1
}

variable "memory_mb" {
  description = "Memory in MB for the task"
  type        = number
  default     = 512
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "my-service"
}

variable "desired_count" {
  description = "Desired number of tasks for the service"
  type        = number
  default     = 1
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "subnet_id" {
  description = "ID of the subnet to use"
  type        = string
  default     = ""
}

variable "gateway_id" {
  description = "ID of the internet gateway"
  type        = string
  default     = ""
}

