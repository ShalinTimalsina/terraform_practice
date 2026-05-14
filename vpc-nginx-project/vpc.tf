# Create a VPC 
resource "aws_vpc" "webserver_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "webserver_vpc"

  }

}


# Create a Public Subnet 
resource "aws_subnet" "public_subnet" {

  vpc_id            = aws_vpc.webserver_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet"

  }

}

# Create a Private Subnet 
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.webserver_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_subnet"
  }
}

# Create a Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.webserver_vpc.id
  tags = {
    Name = "my_igw"
  }
}

# Create a Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.webserver_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public_route_table"
  }

}

# Create Subnet Association 

resource "aws_route_table_association" "public_route_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet.id
}
