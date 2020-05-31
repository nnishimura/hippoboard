resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.vpc-menta.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-menta.id
  }
}

resource "aws_route_table_association" "puclic-a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-route.id
}
