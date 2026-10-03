variable "vpc_cidr_block" {
  type = string
  description = "Valor do agrupamento de endereços da VPC que compartilham o mesmo prefixo"
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type = string
  description = "Valor do agrupamento de endereços da subnet que compartilham o mesmo prefixo"
  default = "10.0.1.0/24"
}

variable "security_group_name" {
  type = string
  description = "Nome do grupo de segurança da instância EC2 com a rule de SSH aberto para IPs especificados"
  default = "terraform-ec2-security-group"
}

variable "cidr_ipv4" {
  type = string
  description = "Endereços que podem acessar a instância EC2"
  default = "0.0.0.0/0"
}

variable "ip_protocol" {
  type = string
  description = "Define qual protocolo será acessivel no grupo de segurança"
}

variable "port" {
  type = number
  description = "Define qual porta da instância será acessivel"
}

variable "ami" {
  type = string
  description = "Define qual AMI será usada para a criação da instância"
  default = "ami-077619b324deb97b0"
}

variable "instance_type" {
  type = string
  description = "Define qual será o tipo de instância, afetando memória e vCPU"
  default = "t3.micro"
}

variable "key_name" {
  type = string
  description = "Define qual será a key para acessar a instância via SSH"
  sensitive = true
}

variable "is_instance_open" {
  type = bool
  description = "Define se a instância terá um IPV4 público para comunicação externa"
}