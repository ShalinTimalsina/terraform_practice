# AWS AMI (Amazon Machine Image)
data "aws_ami" "name" {

  most_recent = true
  owners      = ["amazon"]
}

# Referencing Security Group Already present in this specific region (us-east-1) and this AWS account
data "aws_security_group" "name" {

  tags = {
    mywebserver = "True"
  }
}

# Referercing VPC already created before
data "aws_vpc" "name" {

  tags = {
    vpc = "true"
  }
}

# Referencing  available Availability Zones in my region (us-east-1)
data "aws_availability_zones" "names" {

  state = "available"
}

