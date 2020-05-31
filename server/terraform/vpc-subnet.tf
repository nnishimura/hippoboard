resource "aws_subnet" "public-a" {
  vpc_id            = aws_vpc.vpc-menta.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "vpc-menta_sub"
  }
}
