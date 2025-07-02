output "public_ip" {
    description = "Public IP of the EC2 instance"
    value = aws_instance.web.public_ip
  
}

output "web_url" {
    value = "http://${aws_instance.web.public_ip}"
  
}