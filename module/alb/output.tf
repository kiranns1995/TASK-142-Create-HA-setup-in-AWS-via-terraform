output "alb-target-grp" {
  value = aws_lb_target_group.alb-kwx.id
}
output "alb-id" {

 value = aws_lb.alb-kwx.id

}
output "alb-tg-arn" {
  value = aws_lb_target_group.alb-kwx.arn
}