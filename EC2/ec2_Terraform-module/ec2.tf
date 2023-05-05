#This is terraform Ec2 module and can be kept in Repositories like github/bitbucket.
#create ec2-1 from ami
resource "aws_instance" "ec2created_ami" {
  ami                     = data.aws_ami.hemanth-ami.image_id  #imageid is the attribute to get ami id 
  subnet_id = data.terraform_remote_state.subnet_id.output.subnet_id #remote_state concept
  security_groups = [aws_security_group.hemanth_sg.id] 
  #this is "list of []" - you can specify multiple values with a comma eg :- vpc_security_group_ids = [aws_security_group.hemanth_sg.id,aws_security_group.aryan.sg]  

} 
