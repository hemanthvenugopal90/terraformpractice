data "terraform_remote_state" "vpc" {
  backend = "s3" 
    config = {
    bucket         = "hemanth12690" #use the same bucket and Dynamodb table as vpc
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
    } 
  }

data "aws_ami" "dpt_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220419.0-x86_64-gp2"]
  }
}