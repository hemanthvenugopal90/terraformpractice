resource "aws_launch_template" "hemanth_launchtemplate" {
  name = "hemanth-lc"
  image_id      = data.aws_ami.hemanth-ami.id
  instance_type = "t2.micro"
  key_name   = "hemanth-key"
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.hemanth_sg]
  
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_stop        = true
  disable_api_termination = true

  ebs_optimized = true

  elastic_gpu_specifications {
    type = "test"
  }

  elastic_inference_accelerator {
    type = "eia1.medium"
  }

  iam_instance_profile {
    name = "javahome_ec2_profile"
  }


  instance_initiated_shutdown_behavior = "terminate"

  instance_market_options {
    market_type = "spot"
  }

  kernel_id = "aki-2ab94b43"

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "launch-template-hemanth"
    }
  }
}