resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.vpc-hippoboard.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-hippoboard.id
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-route.id
}

# resource "aws_route_table_association" "public-b" {
#   subnet_id      = aws_subnet.public-b.id
#   route_table_id = aws_route_table.public-route.id
# }
