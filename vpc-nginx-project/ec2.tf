# Create a Ec2 Instance
resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0cca150d127c2216f"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids           = [aws_security_group.webserver_sg.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.my_key.key_name

  tags = {
    Name = "practice_server"
  }

  user_data = <<EOF
  #!/bin/bash
  yum update -y
  yum install -y nginx
  systemctl enable nginx
  systemctl start nginx
  EOF

}

