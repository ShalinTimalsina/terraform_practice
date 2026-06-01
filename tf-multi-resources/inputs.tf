variable "aws_region" {
  default = "us-east-1"
  type    = string
}
variable "subnet_count" {
  description = "This is the number of subnet"
  default = 2
  type = number
 }

variable "instance_count" {
  description = "This is the number of ec2 instances"
  default = 4
  type = number

}
# variable "ami" {
#   default =  "  "

# }


variable "ec2_config" {

  type = list(object({
    ami = string 
    instance_type = string
  }))
  
}


variable "ec2_map" {
  
  type = map(object({
    ami = string 
    instance_type = string
  }))
}