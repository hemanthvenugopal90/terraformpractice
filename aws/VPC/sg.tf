#security group

resource "aws_security_group" "hemanth_sg" {
  name        = "hemanth_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hemanth_vpc.id
  #vpc_id = data.terraform_remote_state.vpc.output.vpc_id (if created in a different folder or project)

  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-Hemanth"
  }
}