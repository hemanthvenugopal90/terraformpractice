terraform {
  backend "s3" {
    
    bucket         = "hemanth12690"
    key            = "iam/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}