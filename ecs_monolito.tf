resource "aws_ecs_service" "service_monolito" {
  name            = "svc-monolito"
  cluster         = aws_ecs_cluster.cluster.arn
  task_definition = aws_ecs_task_definition.task_monolito.arn

  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {
    subnets          = ["${var.subnet01}", "${var.subnet02}", "${var.subnet03}"]
    security_groups  = ["${aws_security_group.sg_monolito.id}"]
    assign_public_ip = true
  }

  health_check_grace_period_seconds = 240

  load_balancer {
    target_group_arn = aws_lb_target_group.tg_monolito.arn
    container_name   = "monolito"
    container_port   = 80
  }

  capacity_provider_strategy {
    base              = 1
    capacity_provider = "FARGATE"
    weight            = 1
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_controller {
    type = "ECS"
  }

  depends_on = [aws_lb.alb_monolito]
}