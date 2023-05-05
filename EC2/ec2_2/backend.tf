terraform {
  backend "s3" {
    bucket         = "hemanth1990-s3" #use the same bucket and Dynamodb table as vpc
    key            = "ec2-2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}