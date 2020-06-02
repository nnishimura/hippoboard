resource "aws_internet_gateway" "gw-hippoboard" {
  vpc_id = aws_vpc.vpc-hippoboard.id
}
