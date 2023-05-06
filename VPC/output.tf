#VPC
output "aws_vpc" {
    value = aws_vpc.hemanth_vpc.id
  
}

#IGW
output "aws_internet_gateway" {
    value = aws_internet_gateway.hemanth_igw.id
  
}

#subnets
output "hemanth_publicsubnet1" {
    value = aws_subnet.hemanth_publicsubnet1.id
  
}

output "hemanth_publicsubnet2" {
    value = aws_subnet.hemanth_publicsubnet2.id
  
}

output "hemanth_privatesubnet" {
    value = aws_subnet.hemanth_privatesubnet.id
  
}

#Elastic IP
output "aws_eip" {
  value = aws_eip.hemanth_elasticip.id

}

#Nat GW
output "aws_nat_gateway" {
    value = aws_nat_gateway.hemanth_NATGW.id
}

#route table Association
output "hemanth_priv_rt" {
    value = aws_route_table.hemanth_priv_rt.id
  
}

output "hemanth_pub1_rt" {
    value = aws_route_table.hemanth_pub1_rt.id
  
}

output "hemanth_pub2_rt" {
    value = aws_route_table.hemanth_pub2_rt.id
  
}

output "hemanth_priv_rta" {
    value = aws_route_table_association.hemanth_priv_rta.id
  
}

output "hemanth_pub1_rta" {
    value = aws_route_table_association.hemanth_pub1_rta.id
  
}

output "hemanth_pub2_rta" {
    value = aws_route_table_association.hemanth_pub2_rta.id
  
}

output "hemanth_sg" {
    value = aws_security_group.hemanth_sg.id
}