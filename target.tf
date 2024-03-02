resource "aws_lb_target_group" "tg" {
  name        = "TG-${var.projectName}"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = var.vpcId

  health_check {
    path    = "/"
    port    = 80
    matcher = "200"
  }
}