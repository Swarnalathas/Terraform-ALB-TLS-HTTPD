# AWS Region
variable "aws_region" {
  default = "eu-west-1"
}

# VPC cidr
variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

# subnets cidr
variable "subnets_cidr" {
  type = list(string)
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}
# subset of Availablity Zone
variable "azs" {
  type = list(string)
  default = ["eu-west-1a", "eu-west-1b"]
}

# Web server ami
variable "webservers_ami" {
  default = "ami-0a7c31280fbd23a86"
}

# instance
variable "instance_type" {
  default = "t2.micro"
}





