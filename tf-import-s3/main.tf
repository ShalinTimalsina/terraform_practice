terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}


resource "aws_s3_bucket" "bucket" {

  bucket = "shalin-s3-bucket-2277"
}
