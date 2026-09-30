// terraform: configurações do terraform (versões de providers, terraform, definições do backend, etc...)
terraform {

}

// provider: define configurações para a estrutura que você está criando de um provider (ex: configs da AWS)
provider "aws" {

}

// resource: cria um recurso especificado pela primeira aspas que tem um nome especificado pela segunda aspas (nome do recurso que é utilizado somente dentro do código). Dentro do bloco são definidas configurações para ele
resource "aws_s3_bucket" "referencia_interna_do_bucket_no_codigo" {
  
}

// data (datasource): busca informações de recursos que não estão sendo geridos pelo terraform
data "aws_vpc" "referencia_interna_da_vpc_no_codigo" {
  
}

// module: pedaços de código que não estão no mesmo diretorio que tem uma função especifica (Ex: módulo para a criação de uma rede)
module "referencia_interna_do_modulo" {
  
}

// variable: variaveis que podem ser utilizadas no código
variable "nome_da_variavel" {
  
}

// output: envia informações de dentro do código para alguma fonte externa
output "nome_do_output" {
  
}

// locals: serve para criar pedaços de código que se repetiriam para que eles possam ser reutilizados em outros blocos
locals {
  
}

// import: importa um determinado recurso para que ele possa ser gerenciado pelo terraform
import {
  
}

// moved: altera a referência interna de um bloco do terraform
moved {
  
}

// removed: indica recursos que não serão mais gerenciados pelo terraform
removed {
  
}

// check: verifica condicionais referente a recursos gerenciados pelo terraform e retorna um aviso caso elas sejam falsas
check "check_name" {
  
}