resource "aws_cloudwatch_log_group" "cloudwatch-log-group-pagamento" {
  name              = "ecs/pagamento"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "cloudwatch-log-stream-pagamento" {
  name           = "ecs-pagamento"
  log_group_name = aws_cloudwatch_log_group.cloudwatch-log-group-pagamento.name
}