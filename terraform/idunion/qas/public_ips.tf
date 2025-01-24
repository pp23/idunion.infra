resource "hcloud_floating_ip" "kubernetes" {
  type          = "ipv6"
  home_location = "fsn1"
}

resource "hcloud_primary_ip" "system_node" {
  name          = "${var.project}-${var.realm}-system-0"
  datacenter    = "fsn1-dc14"
  type          = "ipv6"
  assignee_type = "server"
  auto_delete   = false
}
