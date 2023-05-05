/*data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "hashicorp"
    workspaces = {
      name = "vpc-prod"
    }
  }
}*/

#modify the above code by copying and pasting the backend.tf from another project whose resources you want to use
#so suppose you want to use vpc id created in the "aws" project folder to create a security group in this project/folder,
#you can do so for vpc by providing "vpc_id = data.terraform_remote_state.vpc.output.vpc_id"  


data "terraform_remote_state" "vpc" {
  backend "s3" {
    bucket         = "hemanth1990-s3"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}


#using data block to use ami already present in aws to create an ec2 instance

data "aws_ami" "hemanth-ami" {
  most_recent = true #this will pick ami's which are recently created
  owners = ["self"]

  filter {
    name = "name"
    values = ["myami-*"] #suppose ami = myami-0612, myami-* will pick all ami's with "myami-"

  }
}

