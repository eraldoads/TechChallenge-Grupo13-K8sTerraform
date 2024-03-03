resource "aws_lb" "alb" {
  name               = "ALB-${aws_ecr_repository.repository.name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.sg.id}"]
  subnets            = ["${var.subnet01}", "${var.subnet02}", "${var.subnet03}"]
  idle_timeout       = 120
}

resource "aws_lb_listener" "alb_listener_redirect" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}