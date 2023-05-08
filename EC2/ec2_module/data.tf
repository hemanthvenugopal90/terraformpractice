data "terraform_remote_state" "vpc" {
  backend "s3" {
    bucket         = "hemanth12690" #use the same bucket and Dynamodb table as vpc
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

#associate an elastic ip(static Public ip)
resource "aws_eip" "hemanth_eip" {
  instance = aws_eip.hemanth_eip.id
  vpc      = true
}