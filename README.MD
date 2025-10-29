# OVERVIEW

This solution will deploy two Azure Storage Accounts using terragrunt.

# PRE-REQS

An Azure Resource Group.

Visual Studio Code, Terraform, Terragrunt, Azure CLI.

Clone this repo, open in Visual Studio.

# LOGIN TO AZURE

I use the following commands to logon before I run Terraform:

```
az logout
az account clear

az login --tenant [YOUR_TENANT_ID] --output none
az account set --subscription [YOUR_SUBSCRIPTION_ID]
```

Replace [YOUR_TENANT_ID] & [YOUR_SUBSCRIPTION_ID] in the above with apporpriate values.

# TERRAGRUNT PLAN, APPLY & DESTROY

CD into the 'live' folder then use the following initialise, plan, apply or destroy:

```
terragrunt run --all init

terragrunt run --all plan

terragrunt run --all apply

terragrunt run --all destroy
```

There should be no errors.

A provider.tf file will be auto-generated. This shouldn't be pushed to the repo (it's excluded in .gitignore).

# TESTING

Using the Azure portal, check the Storage Accounts have been created.
