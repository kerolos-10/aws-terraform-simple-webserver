# Create a VPC
resource "aws_vpc" "web" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "vpc-web"
  }
}

# Create Subnet
resource "aws_subnet" "web" {
  vpc_id                  = aws_vpc.web.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  
  tags = {
    Name = "public-subnet"
  }
}

# Security Group
resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.web.id
  
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "sg-web"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "web" {
  vpc_id = aws_vpc.web.id
  
  tags = {
    Name = "igw-web"
  }
}

# Create Route Table
resource "aws_route_table" "web" {
  vpc_id = aws_vpc.web.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web.id
  }
  
  tags = {
    Name = "rt-web"
  }
}

# Associate Subnet with Route Table
resource "aws_route_table_association" "web" {
  subnet_id      = aws_subnet.web.id
  route_table_id = aws_route_table.web.id
}

# Create EC2 Instance
resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.web.id
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name               = var.key_name
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Apache from cloud using Terraform</h1>" > /var/www/html/index.html
              echo "<p>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p>" >> /var/www/html/index.html
              echo "<p>Public IP: $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)</p>" >> /var/www/html/index.html
              EOF
  
  tags = {
    Name = "ec2-web"
  }
}
