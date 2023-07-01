# Create an ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.task_definition_family
  execution_role_arn       = var.execution_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions    = jsonencode([
    {
      name          = "my-container"
      image         = var.container_image
      cpu           = 1
      memory        = 512
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
