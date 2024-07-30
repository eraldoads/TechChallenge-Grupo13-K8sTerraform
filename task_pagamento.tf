resource "aws_ecs_task_definition" "task_pagamento" {
  family = "tsk-pagamento"
  container_definitions = jsonencode([
    {
      essential = true,
      image     = "${aws_ecr_repository.repository_pagamento.repository_url}:latest"
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
          name  = "ConnectionStrings__ConnectionMongoDB"
          value = "mongodb+srv://${var.mgUserPagamento}:${var.mgPassPagamento}@piklesdev.frtwzhj.mongodb.net/"
        },
        {
          name  = "databaseName"
          value = "PagamentoDB"
        },
        {
          name  = "MERCADO_PAGO_BASE_URL"
          value = "https://api.mercadopago.com"
        },
        {
          name  = "MERCADO_PAGO_CRIAR_QR_ORDER_PATH"
          value = "/instore/orders/qr/seller/collectors/1619908702/pos/SUC001POS001/qrs"
        },
        {
          name  = " MERCADO_PAGO_CONSULTAR_QR_ORDER_PATH"
          value = "/merchant_orders/{0}"
        },
        {
          name  = "MERCADO_PAGO_AUTHORIZATION"
          value = "Bearer TEST-1380797655451164-010212-2bb955330b75683baa093d93183e0c2e-1619908702"
        },
        {
          name  = "MERCADO_PAGO_SPONSOR_ID"
          value = "58923039"
        },
        {
          name  = "WEBHOOK_ENDPOINT"
          value = "https://webhook.site/cb4c384e-723d-47c1-b540-ac7cc52a7cae"
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
          awslogs-group         = "${aws_cloudwatch_log_group.cloudwatch-log-group-pagamento.name}"
          awslogs-region        = "${var.regionDefault}"
          awslogs-stream-prefix = "ecs"
        }
      }
      name = "pagamento"
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
