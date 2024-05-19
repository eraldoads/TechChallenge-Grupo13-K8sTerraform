resource "aws_security_group" "sg_produto" {
  name        = "sgproduto"
  description = "sg-produto"
  vpc_id      = var.vpcId

  ingress {
    description = "pikles"
    from_port   = 80
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}