output "aws_route_table" {
    value = aws_route_table.hemanth_priv_rt.id
  
}

output "aws_route_table" {
    value = aws_route_table.hemanth_pub1_rt.id
  
}

output "aws_route_table" {
    value = aws_route_table.hemanth_pub2_rt.id
  
}

output "aws_route_table_association" {
    value = aws_route_table_association.hemanth_priv_rta.id
  
}

output "aws_route_table_association" {
    value = aws_route_table_association.hemanth_pub1_rta.id
  
}

output "aws_route_table_association" {
    value = aws_route_table.hemanth_pub2_rt.id
  
}