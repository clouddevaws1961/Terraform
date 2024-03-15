provider "aws" {
  region = "ap-south-1"
}
module "networking" {
  source            = "./Networking"
  vpc_cidr          = var.vpc_cidr
  public_subnets    = var.public_subnets
  public_subnets_az = var.public_subnets_az
  private_subnets   = var.private_subnets
  private_subnets_az= var.private_subnets_az
}

module "Security-Groups" {
  source = "./Security-Groups"
  vpc_id = module.networking.outputVPCid
}


module "JenkinsServer" {
  source                        = "./Instance"
  ami                           = var.ami
  instance_type                 = "t2.micro"
  key_name                      = "instanceaws"
  associate_public_ip_address   = true
  user_data                     = templatefile("/jenkins-runner-script/jenkins-installer.sh",{})
  subnet_id                     = tolist(module.networking.publicSubnet)[0]
  publickeyjenkins              = file("~/.ssh/instanceaws.pub")
  awsjenkinssecuritygroup       = module.Security-Groups.outputSecurityId
}


