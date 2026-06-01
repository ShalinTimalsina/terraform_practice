terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }
}

locals {
  user_data = yamldecode(file("./users.yaml")).users # Yaml Decode changes it into object

  user_role_pair =flatten( [for user in local.user_data : [for role in user.roles : {
    username = user.username
    role     = role
  }]])
}
