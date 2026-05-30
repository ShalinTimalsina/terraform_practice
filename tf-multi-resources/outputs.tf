output "aws_instance_id" {
  value = aws_instance.ec2_instances[*].id

}
output "aws_subnet_id" {
  value = aws_subnet.main_subnet[*].id
  
}
