#Elastic IP
resource "aws_eip" "hemanth_elasticip" {
  vpc                       = true
  associate_with_private_ip = var.priv_sub_cidr
  depends_on = [aws_internet_gateway.hemanth_igw]
  tags = {
    Name = "hemanth_elasticip"
  }
  
}