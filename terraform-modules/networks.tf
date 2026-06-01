provider "aws" {
  region = "us-east-1"

}


data "aws_availability_zones" "available-az" {
  state = "available"
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs = data.aws_availability_zones.available-az.names
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {

    Environment = "my-test-environment"
  }
}
