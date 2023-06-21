output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.alb.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.tg.arn
}

output "listener_arn" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.alb_listener.arn
}
output "dns_name" {
  description = "DNS name of lb"
  value       = aws_lb.alb.dns_name
}
output "alb_id" {
  description = "id of load balancer"
  value       = aws_lb.alb.id
}
