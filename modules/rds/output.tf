output "rds_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_db_instance.mydb.arn
}

output "allocated_storage" {
  description = "ARN of the Application Load Balancer"
  value       = aws_db_instance.mydb.allocated_storage
}
