resource "aws_internet_gateway" "gw-menta" {
  vpc_id = aws_vpc.vpc-menta.id
}
