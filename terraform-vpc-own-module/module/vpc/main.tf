# Creating VPC 
resource "aws_vpc" "main" {
  cidr_block = var.vpc_config.cidr
  tags = {
    Name = var.vpc_config.vpc_name
  }
}

# Creating Subnets 

resource "aws_subnet" "main" {
  vpc_id   = aws_vpc.main.id
  for_each = var.subnets

  cidr_block        = each.value.cidr_subnet
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

locals {
  public_subnet = {
    for key, config in var.subnets : key => config if config.public
  }
}
# Creating a Internet Gateway, if there is atleast 1 public subnet
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  count  = length(local.public_subnet) > 0 ? 1 : 0 # if greater than zero then the value is one otherwise it's value is zero
}

# Creating a Routing Table 
resource "aws_route_table" "main" {
    count  = length(local.public_subnet) > 0 ? 1 : 0
    vpc_id = aws_vpc.main.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main[0].id
    }

  
}

# Route Table Association 
resource "aws_route_table_association" "main" {
    for_each = local.public_subnet
    subnet_id = aws_subnet.subnet[each.key].id
    route_table_id = aws_route_table.main[0].id
  
}
