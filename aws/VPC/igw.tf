#internetgateway
resource "aws_internet_gateway" "hemanth_igw" {

    vpc_id = aws_vpc.hemanth_vpc.id
    tags = {
    Name = "hemanth-igw"
  }
}