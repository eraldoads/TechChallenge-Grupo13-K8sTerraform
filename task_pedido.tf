resource "aws_ecs_task_definition" "task_pedido" {
  family = "tsk-pedido"
  container_definitions = jsonencode([
    {
      essential = true,
      image     = "${aws_ecr_repository.repository_pedido.repository_url}:latest"
      environment = [
        {
          name  = "ASPNETCORE_ENVIRONMENT"
          value = "Development"
        },
        {
          name  = "ASPNETCORE_URLS"
          value = "http://*:8080"
        },        {
          name  = "ASPNETCORE_HTTP_PORTS"
          value = "8080"
        },
        {
          name  = "ConnectionStrings__ConnectionMysql"
          value = "server=${data.aws_db_instance.database.address};port=3306;userid=${var.rdsUserPedido};password=${var.rdsPassPedido};database=${var.dbNamePedido};"
        },
        {
          name  = "RABBIT_HOSTNAME"
          value = "${var.rabbit_hostname}"
        },
                {
          name  = "RABBIT_USERNAME"
          value = "${var.rabbit_username}"
        },
                {
          name  = "RABBIT_PASSWORD"
          value = "${var.rabbit_password}"
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "${aws_cloudwatch_log_group.cloudwatch-log-group-pedido.name}"
          awslogs-region        = "${var.regionDefault}"
          awslogs-stream-prefix = "ecs"
        }
      }
      name = "pedido"
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
    }
  ])
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::${var.AWSAccount}:role/ecsTaskExecutionRole"
  memory                   = "512"
  cpu                      = "256"  
}   