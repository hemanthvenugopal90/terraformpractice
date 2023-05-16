data "terraform_remote_state" "vpc" {
  backend = "s3" 
    config = {
    bucket         = "hemanth12690" #use the same bucket and Dynamodb table as vpc
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
    } 
  }

data "aws_ami" "hemanth-ami" {
  most_recent = true #this will pick ami's which are recently created
  owners = ["self"]

  filter {
    name = "name"
    values = ["myami-*"] #suppose ami = myami-0612, myami-* will pick all ami's with "myami-"

  }
}