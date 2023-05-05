/*in real time we would always focus on code reusability and avoid duplication of codes, So there will always be modules
for the resources to be created we just have to use those modules and it would contain all the parameters that needs to be passed.
suppose if we want to create an ec2 instance , there will be ec2 module code and we just need to pass their path in
our code and also with desired arguments and values. Only the buisness logic will be kept in the module folder (ec2-module) with no provider,
variable, terraform.tfvars blocks

When you are writing the terraform code you always will be focussing on writing the code as a terraform module
if the module is already present for the same buisness logic, you just use the existing module and pass the values.
If there is no module is the company and you are writing the buisness logic for the very first time, you write it as a module
and keep the module ready and use the module whenever you are deploying the resources    */

module "myec2" { #you can use any name here for the module
  #source = "../ec2_module" #pass this value to pick the existing terraform codes. its getting the buisness logic from ec2-module
  source = "git::https://github.com/hemanthvenugopal90/terraformpractice/tree/3075ff55d1a515edb50ccfebd623d80bf186a3e8/ec2_Terraform-module"
  key_name = var.key_name # you should only supply the values using the reusable modules from a different folder
  instance_type = var.instance_type
}

