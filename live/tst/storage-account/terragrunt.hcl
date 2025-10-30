inputs = {

  storage_account_name = "sacraigtst12345"
  resource_group_name  = "craig-pay-sandbox-rg"
  location             = "uksouth"
  environment          = "tst"

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
