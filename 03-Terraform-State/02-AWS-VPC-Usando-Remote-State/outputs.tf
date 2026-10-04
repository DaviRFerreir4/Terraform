output "subnet_id" {
  description = "ID da subnet da minha VPC"
  value       = aws_subnet.terraform_subnet.id
}

output "security_group_id" {
  description = "ID da security group que libera a porta 22 para SSH"
  value       = aws_security_group.terraform_security_group.id
}