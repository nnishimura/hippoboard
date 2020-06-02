resource "aws_subnet" "public-a" {
  vpc_id            = aws_vpc.vpc-hippoboard.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "vpc-hippoboard_sub"
  }
}

# resource "aws_subnet" "public-b" {
#   vpc_id            = aws_vpc.vpc-hippoboard.id
#   cidr_block        = "10.0.0.0/24"
#   availability_zone = "ap-northeast-1c"
#
#   tags = {
#     Name = "vpc-hippoboard_sub"
#   }
# }
