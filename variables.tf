variable "username" {
  type = string
  default = "123"
}
variable "password" {
  type = string
  default = "123"
}
variable "region" {
  type    = number
}
variable "project" {
  type = string
  default = "123"
}
variable "ports" {
  type = map(list(string))
  default = {
    "22"    = [ "0.0.0.0/0" ]
    "443"   = [ "0.0.0.0/0" ]
    "1999"  = [ "0.0.0.0/0" ]
    "8085"  = [ "0.0.0.0/0" ]
    "8086"  = [ "0.0.0.0/0" ]
  }
}
variable "instance_type" {
  type    = string
}
variable "network_type" {
  type    = string
  default = ""
}
variable "network_name" {
  type    = string
  default = ""
}
variable "floating_ip" {
  type    = bool
  default = false
}
variable "firewall" {
  type    = bool
  default = false
}
variable "volume_size" {
  type    = number
  default = 10
}
variable "delete_on_termination" {
  type = bool
  default = true
}
variable "volume_type" {}
variable "name" {
  type    = string
}
variable "ssh_key_name" {
  type = string
}
variable os {
  type    = string
}
variable "name_templates" {
  type = map(string)
  default = {
    "6"   = "ed-c9-{ip_octets}"
    "10"  = "dt-c2-{ip_octets}"
    "14"  = "anx-c2-{ip_octets}"
    "18"  = "sgc-c2-{ip_octets}"
    "22"  = "rc-c2-{ip_octets}"
  }
}