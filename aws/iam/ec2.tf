resource "aws_instance" "createdforiam" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.id

  tags = {
    Name = "HelloWorld"
  }
}