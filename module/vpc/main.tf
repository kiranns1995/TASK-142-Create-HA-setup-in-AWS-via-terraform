#VPC 
resource "aws_vpc""kwx" {
 #name = "main" 
 cidr_block = var.cidr_block_vpc

}
# Subnets

resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.kwx.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.kwx.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private2"
  }
}
resource "aws_subnet" "public-1" {
  availability_zone = "us-east-2a"
  vpc_id     = aws_vpc.kwx.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public-2" {
  availability_zone = "us-east-2b"
  vpc_id     = aws_vpc.kwx.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "public2"
  }
}
# security groups

resource "aws_security_group" "main" {
  name        = "sec_kwx"
  vpc_id      = aws_vpc.kwx.id

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

ingress {
        from_port       = 0
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_internet_gateway" "igw-kwx" {}

resource "aws_internet_gateway_attachment" "nsd-ig-a" {
  internet_gateway_id = aws_internet_gateway.igw-kwx.id
  vpc_id              = aws_vpc.kwx.id
}
# Route table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.kwx.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-kwx.id
  }

  
  tags = {
    Name = "for-public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public.id
}
