provider "aws" {
    region = var.region
}

#create S3 Bucket
resource "aws_s3_bucket" "hemanth-s3bucket" {
  bucket = "hemanth12690"
    
  tags = {
    Name        = "Hemanth-Venugopal"
    Environment = "Dev"
  }
}

#create Dynamodb
resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform_state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}