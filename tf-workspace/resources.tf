
resource "aws_instance" "ec2_instance_shalin" {
  ami           = "ami-0fdfb4d987b63ae72"
  instance_type = "t3.small"

  tags = {
    Name = "practice_server-${terraform.workspace}"
  }
}

