resource "gcore_volume" "boot_volume" {
  name          = "boot-volume-${var.name}"
  type_name     = var.volume_type
  size          = var.volume_size
  image_id      = data.gcore_image.image.id
  region_id     = var.region
  project_name  = var.project
}

resource "gcore_instance" "hapwi" {
  flavor_id       = var.instance_type
  name_templates  = [lookup(var.name_templates, var.region)]
  keypair_name    = var.ssh_key_name

  volume {
    source      = "existing-volume"
    volume_id   = gcore_volume.boot_volume.id
    boot_index  = 0
    delete_on_termination = var.delete_on_termination
  }

  interface {
    type        = var.network_type
    network_id  = var.network_type == "any_subnet" ? data.gcore_network.network[0].id : null
  }

  security_group {
    id    = var.firewall == true ? gcore_securitygroup.sg[0].id : data.gcore_securitygroup.default.id
    name  = var.name
  }

  region_id     = var.region
  project_name  = var.project
}
//resource "gcore_floatingip" "floating_ip" {
//  project_id  = var.region
//  region_name = var.project
//}