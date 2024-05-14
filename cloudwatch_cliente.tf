resource "aws_cloudwatch_log_group" "cloudwatch-log-group-cliente" {
  name              = "ecs/cliente"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "cloudwatch-log-stream-cliente" {
  name           = "ecs-cliente"
  log_group_name = aws_cloudwatch_log_group.cloudwatch-log-group-cliente.name
}