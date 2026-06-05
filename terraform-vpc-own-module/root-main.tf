provider "aws" {
  region = "us-east-1"

}

module "vpc" {

  source = "./module/vpc"
  vpc_config = {
    vpc_name = "test-vpc"
    cidr     = "10.0.0.0/16"
  }

  subnets = {
    public_subnet_1 = {
      cidr_subnet = "10.0.0.0/24"
      az          = "us-east-1b"
      public = true
    },
     public_subnet_2 = {
      cidr_subnet = "10.0.2.0/24"
      az          = "us-east-1b"
      public = true
    },
    private_subnet = {
      cidr_subnet = "10.0.1.0/24"
      az          = "us-east-1a"
    }
  }

}
