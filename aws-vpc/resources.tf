# Create a VPC
resource "aws_vpc" "my_practice_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_practice_vpc"
  }
}

# Create a Public Subnet
resource "aws_subnet" "practice_public_subnet" {
  vpc_id            = aws_vpc.my_practice_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "practice-public-subnet"
  }
}

# Create a Private Subnet
resource "aws_subnet" "practice_private_subnet" {
  vpc_id            = aws_vpc.my_practice_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "practice-private-subnet"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "practice_igw" {
  vpc_id = aws_vpc.my_practice_vpc.id
  tags = {
    Name = "practice-igw"
  }

}

# Create a Route Table
resource "aws_route_table" "practice_route_table" {
  vpc_id = aws_vpc.my_practice_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.practice_igw.id
  }
  tags = {
    Name = "practice_route_table"
  }

}

# Create Subnet Association with Public Subnet
resource "aws_route_table_association" "public_route" {
    route_table_id = aws_route_table.practice_route_table.id
    subnet_id = aws_subnet.practice_public_subnet.id    
}

