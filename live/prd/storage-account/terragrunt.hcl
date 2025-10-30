locals {
  name_file = "${get_terragrunt_dir()}/random.txt"
  random = fileexists(local.name_file) ? trimspace(file(local.name_file)) : trimspace(run_cmd("powershell", "-Command", "$letters = 'abcdefghijklmnopqrstuvwxyz'; -join ((1..5) | ForEach-Object { $letters[(Get-Random -Minimum 0 -Maximum $letters.Length)] })"))
}

inputs = {
  storage_account_name = "sa${local.random}prd12345"
  resource_group_name  = "craig-pay-sandbox-rg"
  location             = "uksouth"
  environment          = "prd"

  tags = {
    owner  = "devops"
    system = "demo"
  }
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/storage-account"
}

generate "persist_random" {
  path      = "${get_terragrunt_dir()}/random.txt"
  if_exists = "skip"
  contents  = local.random
  disable_signature = true
}
