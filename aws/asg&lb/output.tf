output "aws_launch_template" {
  value = aws_launch_template.hemanth_launchtemplate.id
}

output "aws_launch_configuration" {
    value = aws_launch_configuration.hemanth_launchconfiguration.id
  
}

output "aws_autoscaling_group" {
  value = aws_autoscaling_group.hemanth_asg.id
  
}

output "aws_lb_target_group" {
  value = aws_lb_target_group.hemanth_tg.id
  
}

output "aws_lb" {
  value = aws_lb.hemanth_lb.id
  
}

output "aws_lb_listener" {
  value = aws_lb_listener.hemanth_tg.id
  
}