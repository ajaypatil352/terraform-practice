
output "hosted_zone_id" {
  description = "The ID of the created Route 53 hosted zone"
  value       = aws_route53_zone.example.zone_id
}

output "routing_policy_record_name" {
  description = "The name of the created DNS record based on the routing policy type"
  value       = aws_route53_record.routing_policy.name
}

output "routing_policy_type" {
  description = "The type of routing policy used"
  value       = var.routing_policy_type
}
