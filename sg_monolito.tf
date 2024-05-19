resource "aws_security_group" "sg_monolito" {
  name        = "sgmonolito"
  description = "sg-monolito"
  vpc_id      = var.vpcId

  ingress {
    description = "pikles"
    from_port   = 80
    to_port     = 80
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