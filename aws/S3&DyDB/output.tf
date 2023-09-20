output "aws_s3_bucket" {
    value = aws_s3_bucket.hemanth-s3bucket.id
  
}

output "aws_dynamodb_table" {
    value = aws_dynamodb_table.terraform-lock.id
  
}