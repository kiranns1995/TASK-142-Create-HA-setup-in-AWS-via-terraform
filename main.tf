
module "vpc" {
  source         = "./module/vpc"
  cidr_block_vpc = var.cidr_block_vpc

}

module "Baseinstnace" {
  source                = "./module/Baseinstance"
  subnet_id_BI          = module.vpc.subnet-public1-id
  security_group_ids_BI = module.vpc.sg-group-id
}
module "alb" {
  source              = "./module/alb"
  vpc_id_alb          = module.vpc.vpc-id
  security_groups_alb = module.vpc.sg-group-id
  subnets_alb         = [module.vpc.subnet-public1-id, module.vpc.subnet-public2-id]

}
module "asg" {
  source                  = "./module/asg"
  image-name              = module.Baseinstnace.base-ami-id
  vpc_zone_identifier_asg = module.vpc.subnet-public1-id
  security_groups_asg     = module.vpc.sg-group-id
  target_group_arns_asg   = module.alb.alb-tg-arn

}

