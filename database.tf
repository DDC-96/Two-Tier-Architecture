resource "aws_db_subnet_group" "arch-rds-subgrp" {
  name       = "subnet_group"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  tags = {
    Name = "Subnet group for RDS database"
  }
}

resource "aws_db_instance" "arch-rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  identifier             = var.db_tag
  db_name                = var.db_name
  username               = local.db_creds.username
  password               = local.db_creds.password
  parameter_group_name   = "default.mysql5.7"
  multi_az               = "false"
  publicly_accessible    = "false"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.arch-rds-subgrp.name
  vpc_security_group_ids = [aws_security_group.arch-database-sg.id]
  port                   = var.port

}

data "aws_kms_secrets" "creds" {
  secret {
    name    = "db"
    payload = file("${path.module}/db-creds.yml.encrypted")
  }
}

locals {
  db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["db"])
}