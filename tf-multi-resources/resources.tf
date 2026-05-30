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
  count      = var.subnet_count

  tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}


# Creating 4 Ec2 Instances 2 in each subnet.

# resource "aws_instance" "ec2_instances" {

#   ami = var.ami
#   instance_type = "t3.micro"
#   count = var.instance_count
#   subnet_id = element(aws_subnet.main_subnet[*].id, count.index % length(aws_subnet.main_subnet))
#   tags = {
#     Name = "${local.project}-instance-${count.index}" 
#   }
# }

# Creating 2 instances in different subnet with different ami's
# subnet -1 ---> ec2-1 (ubuntu)
# subnet -2 ---> ec2-2 (amazon-linux)


resource "aws_instance" "task_3" {
  
  count = length(var.ec2_config)
  ami = var.ec2_config[count.index].ami
  instance_type = var.ec2_config[count.index].instance_type
  subnet_id = element(aws_subnet.main_subnet[*].id , count.index % length(aws_subnet.main_subnet))
  tags = {
    Name = "${local.project}-instance-${count.index}" 
  }
}
