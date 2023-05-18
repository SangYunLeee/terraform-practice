# vi new-vpc.tf
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "new_vpc" {
  cidr_block  = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "TRF-VPC"
  }
}

resource "aws_internet_gateway" "new_igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "TRF-IGW"
  }
}
