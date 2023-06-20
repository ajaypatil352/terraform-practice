alb_name = "my-application-lb"
internal_alb = false
load_balancer_type = "application"
security_groups_ids = ["sg-12345678"]
subnet_ids = ["subnet-12345678"]
idle_timeout = 60
alb_tags = {
  Name = "MyApplicationLB"
  Environment = "Production"
}

target_group_name = "my-target-group"
target_group_port = 80
target_group_protocol = "HTTP"
target_group_vpc_id = ""
health_check_path = "/health"

listener_port = 80
listener_protocol = "HTTP"
# ssl_policy = ""
# certificate_arn = ""

listener_routing_type = "forward"
