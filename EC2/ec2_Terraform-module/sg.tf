#in order to use the vpc from "aws" project create remote_state.tf file copy and paste backend from "aws"
#project and specify the vpc_id = data.terraform_remote_state.vpc.output.vpc_id  
# similarly if you want to create subnets subnet_id   = data.terraform_remote_state.vpc.output.subnet.id  


resource "aws_security_group" "hemanth_sg" {
  name        = "hemanth_sg"
  #name = "${var.sg_name}-sg" - concatenation concept using interpolation syntax, appends anything after '-' with the value of the variable.
  description = "Allow TLS inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.output.vpc_id

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
 #["0.0.0.0/0"] - square brackets means "list of" ... you can give multiple values in a square bracket eg:-["0.0.0.0/0", "192.168.0.0/24"]   
 #even in terraform document, wherever you see "list of" for an argument those should be defined within square bracket. 
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
