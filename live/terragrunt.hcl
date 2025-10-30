locals {
  subscription_id = trimspace(run_cmd("az", "account", "show", "--query", "id", "--output", "tsv"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "skip"
  contents  = <<EOF
provider "azurerm" {
  features {}
  storage_use_azuread = true
  subscription_id = "${local.subscription_id}"
}
EOF
}
