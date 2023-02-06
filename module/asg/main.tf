resource "aws_key_pair" "tf-key-pair" {
key_name = "tf-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "tf-key-pair"
}

resource "aws_launch_configuration" "launch-kiran" {
    name                        = var.name_asg
    image_id                    = var.image-name
    instance_type               = var.instance-type
    key_name                    = var.keypair
    security_groups             = [var.security_groups_asg]
    enable_monitoring           = false
    ebs_optimized               = false



    root_block_device {
        volume_type           = var.volume-type
        volume_size           = 8
        delete_on_termination = true
    

    }


}



resource "aws_autoscaling_group" "agp-kiran"{
    desired_capacity          = 1
    health_check_grace_period = 300
    health_check_type         = "EC2"
    launch_configuration      = aws_launch_configuration.launch-kiran.id
    max_size                  = 2
    min_size                  = 1
    name                      = "agp-kiran"
    vpc_zone_identifier       = [var.vpc_zone_identifier_asg]
    target_group_arns         = [var.target_group_arns_asg]

}
