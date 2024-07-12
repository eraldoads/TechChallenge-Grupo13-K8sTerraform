resource "aws_cloudwatch_log_group" "cloudwatch-log-group-pedido" {
  name              = "ecs/pedido"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "cloudwatch-log-stream-pedido" {
  name           = "ecs-pedido"
  log_group_name = aws_cloudwatch_log_group.cloudwatch-log-group-pedido.name
}