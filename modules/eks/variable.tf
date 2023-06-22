variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-west-2a"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "task_family" {
  description = "Family name for the task definition"
  type        = string
  default     = "my-task-family"
}

variable "container_image" {
  description = "Image name for the container"
  type        = string
  default     = "your-container-image"
}

variable "container_cpu" {
  description = "CPU units for the container"
  type        = number
  default     = 256
}

variable "container_memory" {
  description = "Memory limit for the container (in MiB)"
  type        = number
  default     = 512
}

variable "container_port" {
  description = "Port number for the container"
  type        = number
  default     = 80
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "my-service"
}

variable "service_desired_count" {
  description = "Desired number of tasks to run in the service"
  type        = number
  default     = 2
}


