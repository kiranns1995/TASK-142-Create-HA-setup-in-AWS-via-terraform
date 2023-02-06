output "vpc-id-module" {
  value = module.vpc.vpc-id
}

output "SGgrp-module" {
  value = module.vpc.sg-group-id
}

output "base-instance-ami-id" {
  value = module.Baseinstnace.base-ami-id
}
output "alb-targetgroup" {

  value = module.alb.alb-target-grp
}

output "loadbalancer-id" {

  value = module.alb.alb-id

}
output "autoscal-group-id" {

  value = module.asg.asg-id

}

output "launch-config-id" {

  value = module.asg.LC-id

}