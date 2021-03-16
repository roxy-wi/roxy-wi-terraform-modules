resource "gcore_securitygroup" "sg" {
  count         = var.firewall == false ? 0 : 1
  name          = replace(var.name, "/([-\\_])/", "")
  region_id     = var.region
  project_name  = var.project


  dynamic "security_group_rules" {
    for_each = var.ports
    content {
      direction = "ingress"
      ethertype = "IPv4"
      protocol = "tcp"
      port_range_min = security_group_rules.key
      port_range_max = security_group_rules.key
    }
  }

  security_group_rules {
    direction       = "egress"
    ethertype       = "IPv4"
    protocol        = "tcp"
    port_range_min  = 26
    port_range_max  = 65534
  }
}
