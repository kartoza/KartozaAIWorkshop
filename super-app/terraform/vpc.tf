# Define VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" # CIDR block for the VPC
  
  tags = {
    Name = "my-vpc"
  }
}

# Define Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "my-internet-gateway"
  }
}

# Define Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Define Subnets
resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a" # Specify the availability zone
  
  tags = {
    Name = "subnet-a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b" # Specify the availability zone
  
  tags = {
    Name = "subnet-b"
  }
}

# Define Security Group
resource "aws_security_group" "allow_all" {
  vpc_id = aws_vpc.main.id
  
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "allow-all"
  }
}

# Define Outputs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

output "security_group_id" {
  value = aws_security_group.allow_all.id
}

