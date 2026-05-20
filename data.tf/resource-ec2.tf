resource "aws_instance" "name" {

  ami           = data.aws_ami.name.id
  instance_type = "t3.micro"


  tags = {
    Name = "My_server"
  }
}
