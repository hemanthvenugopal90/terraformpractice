#create vpc
resource "aws_vpc" "hemanth_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "hemanth-vpc"
  }
}


