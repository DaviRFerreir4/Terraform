output "instance_ip" {
  description = "IP da instância EC2 criada com terraform"
  value       = aws_instance.instance.public_ip
}