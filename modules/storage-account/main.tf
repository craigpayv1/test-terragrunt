terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

resource "azurerm_storage_account" "this" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false

  tags = merge(
    {
      environment = var.environment
    },
    var.tags
  )

  lifecycle {
    ignore_changes = [
      tags["Atlas_Project"],
      tags["Capability"],
      tags["Deployment-date"],
      tags["OwnerEmailAddress"],
      tags["Project"],
      tags["Team"]
    ]
  }
}
