output "Vpc_id" {
  value = aws_vpc.webserver_vpc.id
}

output "server_ip_address" {
  value = aws_instance.ec2_instance.public_ip

}

output "webserver_live_url" {
  description = "This is the live url of the server"
  value       = "http://${aws_instance.ec2_instance.public_ip}"


}
