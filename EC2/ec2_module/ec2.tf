#This is terraform Ec2 module and can be kept in Repositories like github/bitbucket or any other .
resource "aws_instance" "ec2created_ami" {
    ami = data.aws_ami.hemanth-ami.id
    associate_public_ip_address = var.associate_public_ip_address
    key_name = var.key_name
    instance_type = var.instance_type
    subnet_id = data.terraform_remote_state.vpc.outputs.pub_subnet
    security_groups = [data.aws_security_group.hemanth_sg.id] 
}