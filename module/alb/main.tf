resource "aws_lb_target_group" "alb-kwx" {
  name     = "alb-kwx-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id_alb

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 30
    port = 80
    protocol = "HTTP"
    timeout = 6
    unhealthy_threshold = 2

  }
}



resource "aws_lb" "alb-kwx" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups_alb]
  subnets            = [var.subnets_alb[0],var.subnets_alb[1]]
  idle_timeout       = 60

    tags = {
    Environment = "alb-kwx"
  }
}


resource "aws_lb_listener" "lb-listner" {
  load_balancer_arn = aws_lb.alb-kwx.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-kwx.arn
  }
}

