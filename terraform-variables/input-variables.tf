variable "aws_instance" {

  description = "What type of instance you want?"
  type        = string
  validation {
    condition     = var.aws_instance == "t2.micro" || var.aws_instance == "t3.micro"
    error_message = "Only t2 and t3 micro are allowed"
  }

}

# Short way to write rather than multiple blocks.
variable "ec2_config" {

  type = object({
    volume_size = number
    volume_type = string

  })

  default = {
    volume_size = 20
    volume_type = "gp2"
  }
}


# -------------------------------------------
# -------------------OR----------------------
# -------------------------------------------

# variable "volume_size" {
#   description = "What root volume size you want ?"
#   type        = number
#   default = 20

# }

# variable "volume_type" {

#   description = "what root volume type you want?"
#   type = string
#   default = "gp2"

# }
