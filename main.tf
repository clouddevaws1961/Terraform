# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.40.0"
#     }
#   }
# }

provider "aws" {
  region = "ap-south-1"
}

#vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name ="GlobalVPC"
  }
}

# #internet gateway
# resource "aws_internet_gateway" "igw" {
#   tags = {
#     Name= "GlobalIGW"
#   }
#   depends_on = [ aws_vpc.vpc ]
# }

# #attach internet gateway
# resource "aws_internet_gateway_attachment" "igwattachment" {
#   vpc_id = aws_vpc.vpc.id
#   internet_gateway_id = aws_internet_gateway.igw.id
#   depends_on = [ aws_internet_gateway.igw,aws_vpc.vpc ]
# }


# #public multiple subnet
# resource "aws_subnet" "publicsubnets" {
#   count = length(var.public_subnets)
#   vpc_id = aws_vpc.vpc.id
#   cidr_block = var.public_subnets[count.index]
#   availability_zone = var.public_subnets_az[count.index]
#   map_public_ip_on_launch = true
#   tags = {
#     Name = var.public_subnets_tag[count.index]
#   }
#   depends_on = [ aws_vpc.vpc ]
# }

# #private multiple subnet
# resource "aws_subnet" "privatesubnets" {
#   count = length(var.private_subnets)
#   vpc_id = aws_vpc.vpc.id
#   cidr_block = var.private_subnets[count.index]
#   availability_zone = var.private_subnets_az[count.index]
#   map_public_ip_on_launch = false
#   tags = {
#     Name = var.private_subnets_tag[count.index]
#   }
#     depends_on = [ aws_vpc.vpc ]
# }

# #create public route table 
# resource "aws_route_table" "publicroutes" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block="0.0.0.0/0"
#     gateway_id=aws_internet_gateway.igw.id
#   }
#   tags = {
#     Name ="PublicRouteTable"
#   }

#   depends_on = [ aws_vpc.vpc, aws_internet_gateway.igw ]
# }


# #create routetable association for public subnet
# resource "aws_route_table_association" "publicrouteassociation" {
#   count = length(var.public_subnets)
#   route_table_id = aws_route_table.publicroutes.id
#   subnet_id = aws_subnet.publicsubnets[count.index].id
#   depends_on = [ aws_route_table.publicroutes,aws_subnet.publicsubnets ]
# }
