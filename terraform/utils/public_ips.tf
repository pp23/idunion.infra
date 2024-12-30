resource "hcloud_floating_ip" "kubernetes" {
  type      = "ipv6"
  server_id = hcloud_server.system_node.id
}
