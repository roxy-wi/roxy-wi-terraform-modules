variable "AWS_ACCESS_KEY" {
  type = string
  default = "123"
}
variable "AWS_SECRET_KEY" {
  type = string
  default = "123"
}
variable "region" {
  type    = string
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
variable "public_ip" {
  type    = bool
  default = false
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
variable "volume_type" {
  type = string
  default = "gp2"
}
variable "delete_on_termination" {
  type = bool
  default = true
}
variable "name" {
  type    = string
}
variable "ssh_key_name" {
  type = string
}
variable os {
  type    = string
}
variable "amis_os_map_regex" {
  type = map(string)
  default = {
    "ubuntu-18.04"         = "^ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-.*"
    "ubuntu-18.10"         = "^ubuntu/images/hvm-ssd/ubuntu-cosmic-18.10-amd64-server-.*"
    "ubuntu-19.04"         = "^ubuntu/images/hvm-ssd/ubuntu-disco-19.04-amd64-server-.*"
    "centos-7"             = "^CentOS.Linux.7.*x86_64.*"
    "rhel-7"               = "^RHEL-7.*x86_64.*"
    "rhel-8"               = "^RHEL-8.*x86_64.*"
    "debian-9"             = "^debian-stretch-.*"
    "debian-10"            = "^debian-10-.*"
    "amazon-2_lts"         = "^amzn2-ami-hvm-.*x86_64-gp2"
    "suse-les"             = "^suse-sles-12-sp\\d-v\\d{8}-hvm-ssd-x86_64"
    "suse-les-12"          = "^suse-sles-12-sp\\d-v\\d{8}-hvm-ssd-x86_64"
  }
}

variable "amis_os_map_owners" {
  type        = map(string)
  default = {
    "ubuntu-18.04"         = "099720109477" #CANONICAL
    "ubuntu-18.10"         = "099720109477" #CANONICAL
    "ubuntu-19.04"         = "099720109477" #CANONICAL
    "rhel-7"               = "309956199498" #Amazon Web Services
    "rhel-8"               = "309956199498" #Amazon Web Services
    "centos-7"             = "679593333241"
    "centos-8"             = "679593333241"
    "debian-9"             = "679593333241"
    "debian-10"            = "136693071363"
    "fedora-27"            = "125523088429" #Fedora
    "amazon-2_lts"         = "137112412989" #amazon
    "suse-les"             = "013907871322" #amazon
    "suse-les-12"          = "013907871322" #amazon
  }
}
