
# Create an ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster"  # Update with your desired cluster name
}

# Create a task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                = "my-task-def"  # Update with your desired task definition family
  execution_role_arn    = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"  # Update with the ARN of your execution role
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]  # Update with the launch type compatibility

  container_definitions = <<DEFINITION
[
  {
    "name": "my-container",
    "image": "nginx:latest",  # Update with your desired container image
    "portMappings": [
      {
        "containerPort": 80,  # Update with your container's port
        "protocol": "tcp"
      }
    ],
    "cpu": 1,  # Update with the desired CPU units
    "memory": 512,  # Update with the desired memory in MB
    "essential": true
  }
]
DEFINITION
}

# Create an ECS service
resource "aws_ecs_service" "my_service" {
  name            = "my-service"  # Update with your desired service name
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1 # Update with your desired number of tasks

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    subnets         = [aws_vpc.my_vpc.public_subnets[0]]  # Update with your desired subnets
    security_groups = [aws_security_group.my_security_group.id]
  }
}

# Create a VPC for the ECS cluster
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Update with your desired VPC CIDR block

  tags = {
    Name = "my-vpc"  # Update with your desired VPC name
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

