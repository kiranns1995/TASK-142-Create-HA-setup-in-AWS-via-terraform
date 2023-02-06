
resource "aws_key_pair" "tf-key-pair" {
key_name = "kiranns"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "kiranns.pem"
}
 
resource "aws_instance" "Bastion" {
  ami           = "ami-0ab0629dba5ae551d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tf-key-pair.id
  user_data       = file("user-data.sh")
  subnet_id                   = var.subnet_id_BI
  vpc_security_group_ids      = [var.security_group_ids_BI]
  associate_public_ip_address = true
  tags = {
    "Name" : "Bastion"
  }
 
 

}
resource  "aws_ami_from_instance" "test-wordpress-ami" {
    name               = "ami-wp"
    source_instance_id = aws_instance.Bastion.id
 
  depends_on = [
      aws_instance.Bastion,
      ]
 
  tags = {
      Name = "ami-wp"
  }
 
}