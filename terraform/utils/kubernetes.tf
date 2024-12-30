resource "hcloud_ssh_key" "node_ssh_key" {
  name       = "${var.project}-${var.realm}-kubernetesnodes"
  public_key = var.node_ssh_pub
}

resource "hcloud_primary_ip" "system_node" {
  name          = "${var.project}-${var.realm}-system-0"
  datacenter    = "fsn1-dc14"
  type          = "ipv6"
  assignee_type = "server"
  auto_delete   = true
}

resource "hcloud_server" "system_node" {
  name        = "${var.project}-${var.realm}-system-0"
  datacenter  = "fsn1-dc14"
  image       = var.node_image
  server_type = "cx22"
  ssh_keys    = [hcloud_ssh_key.node_ssh_key.id]

  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
    ipv6         = hcloud_primary_ip.system_node.id
  }
}
