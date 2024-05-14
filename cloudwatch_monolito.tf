resource "aws_cloudwatch_log_group" "cloudwatch-log-group-monolito" {
  name              = "ecs/monolito"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "cloudwatch-log-stream-monolito" {
  name           = "ecs-monolito"
  log_group_name = aws_cloudwatch_log_group.cloudwatch-log-group-monolito.name
}