output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.app_server.id
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i my-ec2-key.pem ubuntu@${aws_instance.app_server.public_ip}"
}