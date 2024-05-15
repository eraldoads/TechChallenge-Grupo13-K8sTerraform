resource "aws_lb" "alb_monolito" {
  name               = "alb-monolito"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.sg_monolito.id}"]
  subnets            = ["${var.subnet01}", "${var.subnet02}", "${var.subnet03}"]
  idle_timeout       = 120
}

resource "aws_lb_listener" "alb_listener_redirect_monolito" {
  load_balancer_arn = aws_lb.alb_monolito.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_monolito.arn
  }
}