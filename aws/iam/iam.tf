resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.javahome_ec2_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "javahome_ec2_role" {
  name = "javahome_ec2_role"
  path        = "/"
  description = "IAM Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#IAM Instance profile - without instance profile we cant attach role to ec2 instance
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "javahome_ec2_profile"
  role = aws_iam_role.javahome_ec2_role.id
}

#create IAM user
resource "aws_iam_user" "hemanth" {
  name = "hemanth-user"
  path = "/system/"

  tags = {
    tag-key = "hemanth"
  }
}