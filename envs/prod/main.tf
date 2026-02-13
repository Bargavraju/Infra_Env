terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "rg" {
  source   = "../../modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "webapp" {
  source = "../../modules/web_app"

  app_name  = var.app_name
  plan_name = var.plan_name
  rg_name   = module.rg.rg_name
  location  = var.location
}
