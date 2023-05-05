#NAT GW
resource "aws_nat_gateway" "hemanth_NATGW" {
  allocation_id = aws_eip.hemanth_elasticip.id
  subnet_id     = aws_subnet.hemanth_publicsubnet1.id
  depends_on = [aws_eip.hemanth_elasticip]

  tags = {
    Name = ""hemanth-NAT""
  }
}
