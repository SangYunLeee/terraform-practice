resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.1.0.0/20"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "TRF-PUBLIC-SUBNET-1A"
  }
}
resource "aws_subnet" "private_subnet_1a" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.1.128.0/20"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "TRF-PRIVATE-SUBNET-1A"
  }
}
resource "aws_subnet" "public_subnet_2c" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.1.16.0/20"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "TRF-PUBLIC-SUBNET-2C"
  }
}
resource "aws_subnet" "private_subnet_2c" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.1.144.0/20"
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "TRF-PRIVATE-SUBNET-2C"
  }
}

# 어떤 서브넷이 어떤 라우팅 테이블을 가지는지를 정의함
resource "aws_route_table_association" "public_subnet_1a_association" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rtb.id
}
resource "aws_route_table_association" "public_subnet_2c_association" {
  subnet_id = aws_subnet.public_subnet_2c.id
  route_table_id = aws_route_table.public_rtb.id
}
resource "aws_route_table_association" "private_subnet_1a_association" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rtb.id
}
resource "aws_route_table_association" "private_subnet_2c_association" {
  subnet_id = aws_subnet.private_subnet_2c.id
  route_table_id = aws_route_table.private_rtb.id
}
