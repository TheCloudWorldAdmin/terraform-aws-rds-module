resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["subnet-016ca944bbb0cbe28", "subnet-069e156c09bb8b982"]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "mysqladmin"
  password             = "Password.12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.default.name
}
