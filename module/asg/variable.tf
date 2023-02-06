variable "name_asg" {
  default = "kiran-asg-launcf"
}

variable "image-name"{
    default = "ami-0ab0629dba5ae551d"
}
variable "instance-type"{
    default = "t2.micro"
}

variable "keypair" {
  default = "tf-key-pair"
}
variable "volume-type" {
  default = "gp2"
}

variable "cidr_block_vpc" {
  default = "10.0.0.0/16"
}
variable "cidr_block_pub1_asg" {
   default = "10.0.1.0/24"
}
variable "cidr_block_pub2_asg" {
    default = "10.0.2.0/24"
  
}
variable "security_groups_asg"{
    default = []
}

variable "vpc_zone_identifier_asg" {
    default =  []
  
}
 variable "target_group_arns_asg" {
   default = []
 }

 



