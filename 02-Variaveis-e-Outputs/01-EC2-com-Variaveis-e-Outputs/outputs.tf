output "vpc_id" {
  description = "ID da VPC criada para a instância EC2"
  value = aws_vpc.my_vpc.id
}

output "instance_public_dns" {
  description = "DNS público da instância EC2"
  value = aws_instance.my_instance.public_dns
  sensitive = true
}