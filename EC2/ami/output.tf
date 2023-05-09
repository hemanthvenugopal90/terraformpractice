output "aws_instance" {
    value = aws_instance.ec2_ami.id
  
}

output "aws_ami_from_instance" {
    value = aws_ami_from_instance.hemanth_ami.id
  
}

