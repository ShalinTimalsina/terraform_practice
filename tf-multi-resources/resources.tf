# This is the local variable 
locals {
  project = "Project-01"
}

# Creating my VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

# Creating my two subnets
resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count      = 2

  tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}


# Creating 4 Ec2 Instances 2 in each subnet.

resource "aws_instance" "ec2_instances" {

  ami = "ami-00e801948462f718a"
  instance_type = "t3.micro"
  count = 8
  subnet_id = element(aws_subnet.main_subnet[*].id, count.index % length(aws_subnet.main_subnet))
  tags = {
    Name = "${local.project}-instance-${count.index}" 
  }
}

