resource "digitalocean_firewall" "hapwi" {
  name = replace(terraform.workspace, "/([-\\_])/", "")
  droplet_ids = [digitalocean_droplet.hapwi.id]
  count = var.firewall == false ? 0 : 1
  outbound_rule {
    port_range            = "1-65535"
    protocol              = "tcp"
    destination_addresses = ["0.0.0.0/0"]
  }
  outbound_rule {
    port_range            = "1-65535"
    protocol              = "udp"
    destination_addresses = ["0.0.0.0/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0"]
  }

  dynamic "inbound_rule" {
    for_each = var.ports
    content {
      port_range       = inbound_rule.key
      source_addresses = inbound_rule.value
      protocol         = "tcp"
    }
  }
}