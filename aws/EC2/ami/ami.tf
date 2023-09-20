#ec2 instance to create ami
resource "aws_instance" "ec2_ami" {
  ami                     = var.ami_id
  instance_type           = var.instance_type

  tags = {
    Name = "ec2_ami"
  }

}

#create ami
resource "aws_ami_from_instance" "hemanth_ami" {
  name               = "myami-terraform"
  source_instance_id = aws_instance.ec2_ami.id

  tags = {
    Name = "hemanth_ami"
  }
}