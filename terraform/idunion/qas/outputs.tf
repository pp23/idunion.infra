output "kubernetes_ip_config" {
  value = {
    ip_address : hcloud_floating_ip.kubernetes.ip_address,
    ip_network : hcloud_floating_ip.kubernetes.ip_network,
  }
}

output "system_node_server" {
  value = hcloud_server.system_node
}
