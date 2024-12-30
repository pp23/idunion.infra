resource "hcloud_ssh_key" "node_ssh_key" {
  name       = "${var.project}-${var.realm}-kubernetesnodes"
  public_key = var.node_ssh_pub
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

  user_data = templatefile("${path.module}/cloud_config.tftpl", { SERVER_IP_ADDRESS = hcloud_floating_ip.kubernetes.ip_address })
}

resource "hcloud_floating_ip_assignment" "system_node" {
  floating_ip_id = hcloud_floating_ip.kubernetes.id
  server_id = hcloud_server.system_node.id
}
