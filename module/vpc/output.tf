output "vpc-id" {
  value = aws_vpc.kwx.id
}

output "subnet-public1-id" {
    value = aws_subnet.public-1.id
  
}
output "subnet-public2-id" {
    value = aws_subnet.public-2.id
  
}
output "sg-group-id" {
    value = aws_security_group.main.id
  
}
output "internetgtway-id" {

    value = aws_internet_gateway.igw-kwx.id
  
}
output "routtable-route_table_id" {
    value = aws_route_table.public.id
  
}
