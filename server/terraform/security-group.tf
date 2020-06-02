resource "aws_security_group" "hippoboard-sg" {
  name        = "hippoboard-sg"
  description = "hippoboard-sg"
  vpc_id      = aws_vpc.vpc-hippoboard.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
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
    Name = "hippoboard-sg"
  }
}
