output "internal_ip" {
  value =  var.private_networking ? digitalocean_droplet.hapwi.ipv4_address_private : null
}
output "public_ip" {
  value = digitalocean_droplet.hapwi.ipv4_address
}