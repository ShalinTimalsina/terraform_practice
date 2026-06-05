# VPC ID
output "vpc_id" {
    value = aws_vpc.main.id
}

locals {
publis_subnet_output = {
    for key , config in local.public_subnet: key => {
        subnet_id = aws_subnet.main[key].id  
        az = aws_subnet.main[key].availability_zone
    } 
}
   
}
# # Subnet Details 
# output "public_subnet_id" {
#     value = 

# }

# output "private_subnet_id" {
#   value = 
# }