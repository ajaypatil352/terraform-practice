
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
    subnets         = var.subnet_id
    security_groups = var.security_groups
  }
}





