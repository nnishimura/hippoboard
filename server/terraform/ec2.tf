resource "aws_instance" "menta-web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids  = [aws_security_group.menta-sg.id]
  subnet_id               = aws_subnet.public-a.id
  key_name   = "menta-key"

  root_block_device {
    volume_type = "gp2"
    volume_size = "10"
  }

  tags = {
    Name = "menta-web"
  }
}

resource "aws_eip" "eip-menta" {
    vpc = true
    instance = aws_instance.menta-web.id
}
