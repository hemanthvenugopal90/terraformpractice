resource "aws_lb" "hemanth_lb" {
  name               = "${var.application}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.vpc.outputs.hemanth_sg]
  subnets            = [data.terraform_remote_state.vpc.outputs.hemanth_publicsubnet1, data.terraform_remote_state.vpc.outputs.hemanth_publicsubnet2]

 tags = {
      application         = "${var.application}-loadbalancer"
  }
}

resource "aws_lb_listener" "hemanth_tg" {
  load_balancer_arn = "${aws_lb.hemanth_lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.hemanth_tg.arn}"
  }
}