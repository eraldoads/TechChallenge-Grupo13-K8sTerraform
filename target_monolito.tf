resource "aws_lb_target_group" "tg_monolito" {
  name        = "tg-monolito"
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