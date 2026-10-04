variable "location" {
  type        = string
  description = "Região onde os recursos da Azure serão criados"
  default     = "Brazil South"
}

variable "account_tier" {
  type        = string
  description = "Tier da Storage Account da Azure"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Tipo de replicação de dados da Storage Account da Azure"
  default     = "LRS"
}