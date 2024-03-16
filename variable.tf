variable "vpc_cidr" {}

variable "public_subnets" {}

variable "public_subnets_az" {}

variable "private_subnets" {}

variable "private_subnets_az" {}

variable "ami" {}

variable "key_name" {
    default = null
}

variable "publickeyInstance" {
    default = null
}

 variable "awsSecuritygroup" {
     default = null
}

variable "instanceTag" {
    default = null
}