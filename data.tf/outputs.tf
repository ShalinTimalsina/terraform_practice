# Display's the AMI 
output "aws_ami" {

  value = data.aws_ami.name.id
}

# Display's the Security Group
output "aws_security_group" {
  value = data.aws_security_group.name.id
}


# Display's The VPC
output "aws_vpc" {
  value = data.aws_vpc.name.id

}

# Diplay's the available zones in this specific region
output "aws_zones" {

  value = data.aws_availability_zones.names.names
}
