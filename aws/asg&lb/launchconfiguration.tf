resource "aws_launch_configuration" "hemanth_launchconfiguration" {
  name_prefix     = "hemanth-launchconfiguration"
  image_id        = data.aws_ami.hemanth-ami.id
  instance_type   = "t2.micro"
  security_groups = [data.terraform_remote_state.vpc.outputs.hemanth_sg]
  key_name   = "hemanth-key"
  iam_instance_profile = "javahome_ec2_profile"
    
    lifecycle {
    create_before_destroy = true
  }
}