resource "aws_instance" "ec2_instance" {
  ami           = "ami-0fdfb4d987b63ae72"
  instance_type = "t3.small"
  subnet_id = aws_subnet.practice_public_subnet.id
  tags = {
    Name = "practice_server"
  }
}
