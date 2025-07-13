output "instance_public_ip" {
  value       = aws_instance.my_ec2.public_ip
  description = "Public IP of EC2 instance"
}

output "instance_public_dns" {
  value       = aws_instance.my_ec2.public_dns
  description = "Public DNS of EC2 instance"
}

output "vpc_id" {
  value       = aws_vpc.web.id
  description = "VPC ID"
}

output "subnet_id" {
  value       = aws_subnet.web.id
  description = "Subnet ID"
}

output "security_group_id" {
  value       = aws_security_group.web.id
  description = "Security Group ID"
}

output "web_url" {
  value       = "http://${aws_instance.my_ec2.public_ip}"
  description = "URL to access the web server"
}