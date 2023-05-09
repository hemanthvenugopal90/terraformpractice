output "aws_instance" {
  value = aws_instance.createdforiam.id
}

output "aws_iam_role_policy" {
    value = aws_iam_role_policy.test_policy.id
  
}

output "aws_iam_role" {
    value = aws_iam_role.javahome_ec2_role.id
  
}

output "aws_iam_instance_profile" {
    value = aws_iam_instance_profile.ec2_profile.id
  
}

output "aws_iam_user" {
    value = aws_iam_user.hemanth.id
  
}