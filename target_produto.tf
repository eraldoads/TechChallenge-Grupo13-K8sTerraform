resource "aws_lb_target_group" "tg_produto" {
  name        = "tg-produto"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = var.vpcId

  health_check {
    path    = "/"
    port    = 8080
    matcher = "200"
  }
}