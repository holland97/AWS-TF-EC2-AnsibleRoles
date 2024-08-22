# Create VPC
resource "aws_vpc" "demovpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Project TF CircleCI"
  }
}

# Create public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true  # Provides public IPs to instances launched in subnet
  availability_zone       = var.az1

  tags = {
    Name = "Project TF CircleCI"
  }
}

# Create private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.demovpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.az2

  tags = {
    Name = "Project TF CircleCI"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demovpc.id

  tags = {
    Name = "Project TF CircleCI"
  }
}

# Create route table for public subnet
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.demovpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Create association between subnet and route table
resource "aws_route_table_association" "rt-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt.id
}

# Create security group
resource "aws_security_group" "sg" {
  description = "Allow SSH traffic"
  vpc_id      = aws_vpc.demovpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
