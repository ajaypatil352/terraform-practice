resource "aws_lb" "alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["subnet-12345678", "subnet-87654321"]  # Replace with your subnet IDs
  enable_deletion_protection = true
  idle_timeout {
    timeout_seconds = 60
  }
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "need to be add"  
  health_check {
    path = "/health"
  } 
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  ssl_policy        = "policy nned to be add"
  certificate_arn   = "need to be add certificate arn"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


