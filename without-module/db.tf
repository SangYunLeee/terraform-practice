# DB 서브넷 그룹 생성
resource "aws_db_subnet_group" "dbsubg" {
  name = "sprint-db-subg"
  subnet_ids = [
    aws_subnet.private_subnet_1a.id,
    aws_subnet.private_subnet_2c.id
  ]
  tags = {
    "Name" = "sprint-db-subg"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage    = 20
  db_name              = "test"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "sori"
  password             = "dltkddbs"
  identifier           = "trf-rds"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.db.id]
  availability_zone = aws_subnet.private_subnet_1a.availability_zone
  db_subnet_group_name = aws_db_subnet_group.dbsubg.name
  tags = {
      "Name" = "TRF-MYSQL"
  }
}
