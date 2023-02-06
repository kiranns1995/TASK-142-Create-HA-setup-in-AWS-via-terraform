

output "base-ami-id" {
    value = aws_ami_from_instance.test-wordpress-ami.id
}