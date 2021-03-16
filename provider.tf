terraform {
  required_providers {
    gcore = {
      source = "G-Core/gcorelabs"
      version = "0.1.5"
    }
  }
}

provider "gcore" {
  user_name       = var.username
  password        = var.password
  gcore_platform  = "https://api.gcdn.co"
  gcore_api       = "https://api.cloud.gcorelabs.com"
}
