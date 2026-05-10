terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }


    backend "s3" {
        bucket = "shalin-practice-175dbefc0415a563"
        key = "backend.tfstate"
        region = "us-east-1"

      
    }
}
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "ec2_backend" {
  ami           = "ami-0fdfb4d987b63ae72"
  instance_type = "t3.small"

  tags = {
    Name = "backend_ec2_shalin_timalsina"
  }
}

