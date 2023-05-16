resource "aws_lb_target_group" "hemanth_tg" {
  name     = "${var.application}-tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id =   data.terraform_remote_state.vpc.outputs.aws_vpc

health_check {
                path = "/index.html"
                port = "80"
                protocol = "HTTP"
                healthy_threshold = 2
                unhealthy_threshold = 2
                interval = 5
                timeout = 4
                matcher = "200-308"
        }
}