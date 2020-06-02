resource "aws_instance" "hippoboard-web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids  = [aws_security_group.hippoboard-sg.id]
  subnet_id               = aws_subnet.public-a.id
  key_name   = "hippoboard-key"

  root_block_device {
    volume_type = "gp2"
    volume_size = "10"
  }

  tags = {
    Name = "hippoboard-web"
  }
}

resource "aws_eip" "eip-hippoboard" {
    vpc = true
    instance = aws_instance.hippoboard-web.id
}
