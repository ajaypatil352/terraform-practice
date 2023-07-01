output "ecs_cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.my_cluster.arn
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.my_task_definition.arn
}

output "service_arn" {
  description = "ARN of the ECS service"
  value       = aws_ecs_service.my_service.arn
}

output "service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.my_service.name
}

output "service_url" {
  description = "URL of the ECS service"
  value       = aws_ecs_service.my_service.load_balancer.first.hostname
}

