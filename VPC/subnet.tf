#subnets
#public subnet 1
resource "aws_subnet" "hemanth_publicsubnet1" {
  

    vpc_id = aws_vpc.hemanth_vpc.id
    availability_zone = var.pub_sub1_az
    cidr_block = var.pub_sub1_cidr

  tags = {
    Name = "hemanth_publicsubnet1 Default subnet for us-east-1"
  }
}

#public subnet 2

resource "aws_subnet" "hemanth_publicsubnet2" {
  
   
    vpc_id = aws_vpc.hemanth_vpc.id
    availability_zone = var.pub_sub2_az
    cidr_block =  var.pub_sub2_cidr

  tags = {
    Name = "hemanth_publicsubnet2 Default subnet for us-east-1"
  }
}

#private subnet 
resource "aws_subnet" "hemanth_privatesubnet" {
  
  
    vpc_id = aws_vpc.hemanth_vpc.id
    availability_zone = var.priv_sub_az
    cidr_block = var.priv_sub_cidr

  tags = {
    Name = "hemanth_privatesubnet Default subnet for us-east-1"
  }
}