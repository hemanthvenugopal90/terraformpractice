module "myec2" { 
  source = "../ec2_module" 
  #source = "github.com/hemanthvenugopal90/terraformpractice/EC2/ec2_module" 
  region = var.region
  associate_public_ip_address = var.associate_public_ip_address
  key_name = var.key_name
  instance_type = var.instance_type
}