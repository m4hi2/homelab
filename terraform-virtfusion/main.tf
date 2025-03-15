terraform {
  required_providers {
    virtfusion = {
      source  = "EZSCALE/virtfusion"
      version = "0.0.3"
    }
  }
}

provider "virtfusion" {
  endpoint  = var.virtfusion_api_url
  api_token = var.virtfusion_access_token
}

variable "virtfusion_api_url" {}
variable "virtfusion_access_token" {}
variable "ssh_keys" {}
variable "user_id" {}

variable "virtfusion_nodes" {
  type    = list(string)
  default = ["node1", "node2", "node3", "controlpane"]
}

resource "virtfusion_server" "nodes" {
  for_each = toset(var.virtfusion_nodes)

  package_id    = 1
  user_id       = var.user_id
  hypervisor_id = 2
  ipv4          = 1
  storage       = 30
  memory        = 2048
  cores         = 2
  traffic       = 1000
}

resource "virtfusion_build" "nodes" {
  for_each = toset(var.virtfusion_nodes)

  server_id = virtfusion_server.nodes[each.key].id
  name      = each.key
  hostname  = "${each.key}.dustudevs.com"
  osid      = 16
  vnc       = false
  ssh_keys  = var.ssh_keys # I already have an SSH key with them
}
