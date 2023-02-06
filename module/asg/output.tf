output "asg-id" {
  value       =  aws_autoscaling_group.agp-kiran.id
} 
output "LC-id" {

  value = aws_launch_configuration.launch-kiran.id
  
}