# Create a Security group that allows HTTP 
resource "aws_security_group" "webserver_sg" {
  name        = "HTTP_allow"
  description = "It allows users to access the webpage"
  vpc_id      = aws_vpc.webserver_vpc.id

  # Inbound Rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  # SSH Access
  ingress {
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }
  tags = {
    Name = "webserver_sg"
  }


}
