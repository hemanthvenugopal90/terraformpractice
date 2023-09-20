resource "aws_autoscaling_group" "hemanth_asg" {
  name                      = "hemanth-asg"
  max_size                  = var.asg_max_cap
  min_size                  = var.asg_min_cap
  desired_capacity          = var.asg_desired_cap
  health_check_grace_period = var.asg_health_check_grace_period
  health_check_type         = var.asg_health_check_type
  force_delete              = var.asg_force_delete
  termination_policies      = var.asg_termination_policies
  suspended_processes       = var.asg_suspended_processes
  launch_configuration      = aws_launch_configuration.hemanth_launchconfiguration.name
  vpc_zone_identifier       = [data.terraform_remote_state.vpc.outputs.hemanth_publicsubnet1, data.terraform_remote_state.vpc.outputs.hemanth_publicsubnet2]
  default_cooldown          = var.asg_default_cooldown
  enabled_metrics           = var.asg_enabled_metrics
  metrics_granularity       = var.asg_metrics_granularity
  protect_from_scale_in     = var.asg_protect_from_scale_in
  target_group_arns         = ["${aws_lb_target_group.hemanth_tg.arn}"]
  
  tag {
    key                 = "hemanth"
    value               = "asg"
    propagate_at_launch = true
  }
}