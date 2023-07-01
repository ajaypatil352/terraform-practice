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
  default     = "arn:aws:iam::442365855901:role/ecs"
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
  default     = "subnet-0468f5485183afd26"
}

variable "gateway_id" {
  description = "ID of the internet gateway"
  type        = string
  default     = ""
}
# Create a security group for the ECS cluster
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

