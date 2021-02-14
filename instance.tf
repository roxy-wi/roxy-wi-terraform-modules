resource "digitalocean_droplet" "hapwi" {
  image               = var.os
  name                = var.name
  region              = var.region
  size                = var.size
  backups             = var.backup
  ssh_keys            = var.ssh_key_name == "None" ? var.ssh_ids : tolist(data.digitalocean_ssh_key.ssh_id[*].id)
  private_networking  = var.private_networking
  monitoring          = var.monitoring
}
resource "digitalocean_floating_ip" "floating_ip" {
  count = var.floating_ip == true ? 1 : 0
  droplet_id = digitalocean_droplet.hapwi.id
  region     = digitalocean_droplet.hapwi.region
}
data "digitalocean_ssh_key" "ssh_id" {
  count = var.ssh_key_name == "None" ? 0 : 1
  name = var.ssh_key_name
}