
#Set up an RDS instance for the Data Tier.

#rds file

resource "aws_db_subnet_group" "rds-subnet" {

  name = "rds-subnet"

  subnet_ids = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]

  tags = {

    Name = "Db subnet group"

  }

}

resource "aws_db_instance" "rds-subnet" {

  allocated_storage = 10

  db_subnet_group_name = aws_db_subnet_group.rds-subnet.id

  engine = "mysql"

  engine_version = "8.0.46"

  instance_class = "db.t3.micro"

  multi_az = true

  username = "admin"

  password = "password"

  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.db-sg.id]

}