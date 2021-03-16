data "gcore_network" "network" {
  count = var.network_type == "any_subnet" ? 1 : 0
  name          = var.network_name
  region_id     = var.region
  project_name  = var.project
}

data "gcore_image" "image" {
  name          = var.os
  region_id     = var.region
  project_name  = var.project
}

data "gcore_securitygroup" "default" {
  name = "default"
  region_id     = var.region
  project_name  = var.project
}