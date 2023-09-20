terraform {
  backend "s3" {
    bucket         = "hemanth12690" #use the same bucket and Dynamodb table as vpc
    key            = "ec2-deploy2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}