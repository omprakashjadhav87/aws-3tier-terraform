resource "aws_vpc" "BluePeak" {

  cidr_block = var.vpc_cidr

  instance_tenancy = "default"

  tags = {

    Name = "BluePeak"

  }

}