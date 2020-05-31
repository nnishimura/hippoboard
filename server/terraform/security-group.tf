resource "aws_security_group" "menta-sg" {
  name        = "menta-sg"
  description = "menta-sg"
  vpc_id      = aws_vpc.vpc-menta.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1" # ALL
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "menta-sg"
  }
}
