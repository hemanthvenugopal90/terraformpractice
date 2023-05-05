#Route tables
resource "aws_route_table" "hemanth_pub1_rt" {
  
  vpc_id = aws_vpc.hemanth_vpc.id

  route {
    cidr_block = var.rt_destination_cidr
    gateway_id = aws_internet_gateway.hemanth_igw.id
  }
}

resource "aws_route_table" "hemanth_pub2_rt" {
  
  vpc_id = aws_vpc.hemanth_vpc.id
  route {
    cidr_block = var.rt_destination_cidr
    gateway_id = aws_internet_gateway.hemanth_igw.id
  }
}
resource "aws_route_table" "hemanth_priv_rt" {
  
  vpc_id = aws_vpc.hemanth_vpc.id
  route {
    cidr_block = var.rt_destination_cidr
    gateway_id = aws_nat_gateway.hemanth_NATGW.id
  }
}

#routetable association (associating the created route tables to a subnet/route table/internet gateway/virtual pvt gw)
resource "aws_route_table_association" "hemanth_pub1_rta" {
  subnet_id      = aws_subnet.hemanth_publicsubnet1.id
  route_table_id = aws_route_table.hemanth_pub1_rt.id
}

resource "aws_route_table_association" "hemanth_pub2_rta" {
  subnet_id      = aws_subnet.hemanth_publicsubnet2.id
  route_table_id = aws_route_table.hemanth_pub2_rt.id
}

resource "aws_route_table_association" "hemanth_priv_rta" {
  subnet_id      = aws_subnet.hemanth_privatesubnet.id
  route_table_id = aws_route_table.hemanth_priv_rt.id 
}