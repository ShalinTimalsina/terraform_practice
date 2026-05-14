# Create a Ec2 Instance
resource "aws_instance" "ec2_instance" {
  ami                         = "ami-091138d0f0d41ff90"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids           = [aws_security_group.webserver_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "practice_server"
  }

  user_data = <<-EOF
  
              #!/bin/bash
              apt update -y
              apt upgrade -y
              apt install nginx -y
              systemctl enable nginx --now
              EOF
}

