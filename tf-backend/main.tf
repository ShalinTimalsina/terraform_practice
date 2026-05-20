terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }

  # Added the backend for state management which is stored in a already made s3 bucket
    backend "s3" {
        bucket = "shalin-practice-175dbefc0415a563"
        key = "backend.tfstate"
        region = "us-east-1"

      
    }
}


