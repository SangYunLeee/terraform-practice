resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_igw.id
  }
  tags = {
    Name = "TRF-PUBC-RTB"
  }
}

resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "TRF-PRIV-RTB"
  }
    route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.ngw.id
  }
}
