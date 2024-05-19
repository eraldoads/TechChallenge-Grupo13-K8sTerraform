resource "aws_cloudwatch_log_group" "cloudwatch-log-group-produto" {
  name              = "ecs/produto"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "cloudwatch-log-stream-produto" {
  name           = "ecs-produto"
  log_group_name = aws_cloudwatch_log_group.cloudwatch-log-group-produto.name
}