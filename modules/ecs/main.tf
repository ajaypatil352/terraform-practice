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

# Create a VPC for the ECS cluster
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create a route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }
}

# Associate the route table with the VPC's main route table
resource "aws_main_route_table_association" "my_association" {
  vpc_id         = aws_vpc.my_vpc.id
  route_table_id = aws_route_table.my_route_table.id
}

# Create a security group for the ECS cluster
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
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

# Create an ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = var.cluster_name
}

# Create an ECS task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.task_definition_family
  execution_role_arn       = var.execution_role_arn
  network_mode             = "awsvpc"

  cpu                      = 256

  container_definitions    = jsonencode([
    {
      name          = "my-container"
      image         = var.container_image
      memory        = var.memory_mb
      essential     = true
      portMappings  = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]
    }
  ])
}

# Create an ECS service
resource "aws_ecs_service" "my_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = var.desired_count

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    subnets         = [var.subnet_id]
    security_groups = [aws_security_group.my_security_group.id]
  }
}


