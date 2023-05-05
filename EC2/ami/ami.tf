#ec2 instance to create ami
resource "aws_instance" "ec2_ami" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t2.micro"

}

#create ami
resource "aws_ami_from_instance" "Goldenimage" {
  name               = "Golden-image"
  source_instance_id = aws_instance.ec2_ami.id
}