resource "aws_instance" "ec2_instance" {
  ami           = "ami-0fdfb4d987b63ae72"
  instance_type = var.aws_instance

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_config.volume_size
    volume_type           = var.ec2_config.volume_type
  }
  tags = {
    Name = local.name
  }
}

locals {
  owner = "Shalin"
  name = "My-Server"
}