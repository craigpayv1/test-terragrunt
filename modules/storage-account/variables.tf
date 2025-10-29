variable "storage_account_name" {
  description = "The name of the storage account (must be globally unique)"
  type        = string
}

variable "resource_group_name" {
  description = "The existing resource group name"
  type        = string
}

variable "location" {
  description = "Azure region for the storage account"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "tags" {
  description = "Additional resource tags"
  type        = map(string)
  default     = {}
}
