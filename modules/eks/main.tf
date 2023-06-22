# Create a VPC for the ECS cluster
resource "aws_vpc" "ecs_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Create a subnet within the VPC
resource "aws_subnet" "ecs_subnet" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

# Create an ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = var.ecs_cluster_name
}

# Create a task definition for your container
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.task_family
  container_definitions    = jsonencode([
    {
      "name": "my-container",
      "image": var.container_image,
      "cpu": var.container_cpu,
      "memory": var.container_memory,
      "portMappings": [
        {
          "containerPort": var.container_port,
          "hostPort": var.container_port,
          "protocol": "tcp"
        }
      ],
      "essential": true
