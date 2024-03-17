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

module "jenkinsKey-pair" {
  source = "./key-pair"
  key_name ="jenkinskeypair" 
  publickeyInstance = file("~/.ssh/jenkins.pub")
}


module "JenkinsServer" {
  source                        = "./Instance"
  ami                           = var.ami
  instance_type                 = "t2.large"
  key_name                      = "jenkinskeypair"
  associate_public_ip_address   = true
  user_data                     = templatefile("/jenkins-runner-script/jenkins-installer.sh",{})
  subnet_id                     = tolist(module.networking.publicSubnet)[0]
  awsSecuritygroup              = module.Security-Groups.outputSecurityId
  instanceTag                   ="JenkinsServer"
  privatekeypath                ="~/.ssh/jenkins" 

}

module "dockerKey-pair" {
  source = "./key-pair"
  key_name ="dockerkeypair" 
  publickeyInstance = file("~/.ssh/docker.pub")
}

# module "DockerServer" {
#   source                        = "./Instance"
#   ami                           = var.ami
#   instance_type                 = "t2.medium"
#   key_name                      = "dockerkeypair"
#   associate_public_ip_address   = true
#   user_data                     = templatefile("/docker-runner-script/docker-installer.sh",{})
#   subnet_id                     = tolist(module.networking.publicSubnet)[1]
#   awsSecuritygroup              = module.Security-Groups.outputSecurityId
#   instanceTag                   ="DockerServer"
#   privatekeypath                ="~/.ssh/docker"
# }



