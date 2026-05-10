
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0fdfb4d987b63ae72"
  instance_type = "t3.small"

  tags = {
    Name = "practice_server"
  }
}

