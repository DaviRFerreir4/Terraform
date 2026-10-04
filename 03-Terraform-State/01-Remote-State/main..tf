terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.67.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.8.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "davirf"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  features {}
}