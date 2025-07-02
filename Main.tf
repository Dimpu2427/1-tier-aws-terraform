provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "one-tier-vpc"
    }
  
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
      Name = "one-tier-subnet"
    }
  
}
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
    tags = {
      Name = "one-tier-igw"
    }
  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id

    }
    tags = {
      Name = "public-route-table"
    }
  
}

resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.main.id
    route_table_id = aws_route_table.public.id
  
}

resource "aws_security_group" "allow_All" {
    name = "allow_all"
    vpc_id = aws_vpc.main.id
    ingress {
        description = "all"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        description = "all"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "one-tier-sg"
    }
  
}

resource "aws_instance" "web" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [aws_security_group.allow_All.id]
    key_name = "1-tier"

    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo amazon-linux-extras enable nginx1
                sudo yum install -y nginx
                sudo systemctl start nginx
                sudo systemctl enable nginx
                sudo systemctl status nginx
                EOF

    tags ={
        Name = "web-server"
    }            
  
}