variable "token" {
  type = string
  default = ""
}
variable "region" {
  type = string
}
variable "name" {
  type = string
}
variable "os" {
  type = string
}
variable "size" {
  type = string
}
variable "backup" {
  type = bool
  default = true
}
variable "firewall" {
  type = bool
  default = false
}
variable "ssh_ids" {
  type = list
}
variable "ssh_key_name" {
  type = string
}
variable "private_networking" {
  type = bool
  default = true
}
variable "floating_ip" {
  type = bool
  default = true
}
variable "monitoring" {
  type = bool
  default = true
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
