variable "vpc_cidr" {
 }

variable "public_subnets" {
}

variable "public_subnets_az" {
}

variable "public_subnets_tag" {
  type = list
  default = ["PublicSubnet","PublicSubnet1","PublicSubnet2"]
}

variable "private_subnets_tag" {
  type = list
  default = ["PrivateSubnet"]
}

variable "private_subnets" {
}

variable "private_subnets_az" {
}

output "outputVPCid" {
  value = aws_vpc.vpc.id
}

output "publicSubnet" {
  value = aws_subnet.publicsubnets.*.id
}




