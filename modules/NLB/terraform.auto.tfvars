nlb_name = "my-network-lb"
internal_nlb = false
load_balancer_type = "network"
# security_groups_ids = ["sg-0abfff9a7f0408b50"]
subnet_ids = ["subnet-0468f5485183afd26", "subnet-0f3cb7bf73de0e8ef"]
idle_timeout = 60
nlb_tags = {
  Name = "NetworkLB"
  Environment = "Production"
}

target_group_name = "my-target-group"
target_group_port = 80
target_group_protocol = "HTTP"
target_group_vpc_id = "vpc-0f805e416c315a1fa"
health_check_path = "/health"

listener_port = 80
listener_portocol = "TCP"
# ssl_policy = ""
# certificate_arn = ""

listener_routing_type = "forward"
