output "aws_security_group" {
    value = aws_security_group.hemanth_sg
  
}

output "aws_instance" {
    value = aws_instance.ec2_ami.id

}

output "aws_ami_from_instance" {
    value = aws_ami_from_instance.Goldenimage.id
  
}

output "aws_instance" {
    value = aws_instance.ec2created_ami.id
  
}

output "aws_s3_bucket" {
    value = aws_s3_bucket.hemanth-s3bucket
  
}

output "aws_dynamodb_table" {
    value = aws_dynamodb_table.terraform-lock
  
}