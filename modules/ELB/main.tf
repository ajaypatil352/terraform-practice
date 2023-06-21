resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.internal_alb
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups_ids
  subnets            = var.subnet_ids
  enable_deletion_protection = true
  idle_timeout =  var.idle_timeout
  
  tags = var.alb_tags
}

resource "aws_lb_target_group" "tg" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.target_group_vpc_id 
  health_check {
    path = var.health_check_path
  } 
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_portocol
  #ssl_policy        = var.ssl_policy
  #certificate_arn   = var.certificate_arn
  
  default_action {
    type             = var.listener_routing_type
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


