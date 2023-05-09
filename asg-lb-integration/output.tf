output "dpt_sg" {
    value = aws_security_group.dpt_sg.id
  
}

output "aws_launch_configuration" {
    value = aws_launch_configuration.dpt_lc.id
  
}

output "aws_autoscaling_group" {
    value = aws_autoscaling_group.dpt_asg.id
  
}

