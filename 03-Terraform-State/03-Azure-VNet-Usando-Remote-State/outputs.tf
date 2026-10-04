output "subnet_id" {
  description = "ID da subnet da Azure"
  value       = azurerm_subnet.subnet.id
}

output "security_group_id" {
  description = "ID da security group da Azure"
  value       = azurerm_network_security_group.nsg.id
}