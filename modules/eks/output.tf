output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.my_cluster.id
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.my_task_definition.arn
}

output "service_id" {
  description = "ID of the ECS service"
  value       = aws_ecs_service.my_service.id
}

output "service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.my_service.name
}

