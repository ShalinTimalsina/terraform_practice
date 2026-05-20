resource "aws_instance" "ec2_backend" {
  ami           = "ami-0fdfb4d987b63ae72"
  instance_type = "t3.small"

  tags = {
    Name = "backend_ec2_shalin_timalsina"
  }
}

