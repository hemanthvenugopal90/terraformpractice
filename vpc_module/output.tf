output "aws_vpc" {
    value = aws_vpc.hemanth_vpc.id
  
}

output "aws_internet_gateway" {
    value = aws_internet_gateway.hemanth_igw.id
  
}

output "hemanth_publicsubnet1" {
    value = aws_subnet.hemanth_publicsubnet1.id
  
}

output "hemanth_publicsubnet2" {
    value = aws_subnet.hemanth_publicsubnet2.id
  
}

output "hemanth_publicsubnet2" {
    value = aws_subnet.hemanth_privatesubnet.id
  
}

output "aws_eip" {
  value = aws_eip.hemanth_elasticip.id

}

output "aws_nat_gateway" {
    value = aws_nat_gateway.hemanth_NATGW.id
  
}

