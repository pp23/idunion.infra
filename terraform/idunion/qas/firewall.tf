resource "hcloud_firewall" "kubernetes_system_node" {
  name = "kubernetes-system-node"

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    description = "HTTP"
    source_ips = [
      "::/0",
    ]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    description = "HTTPS"
    source_ips = [
      "::/0",
    ]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    description = "SSH"
    source_ips = [
      var.allowed_admin_access_ip,
    ]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "6443"
    description = "kubernetes control plane"
    source_ips = [
      var.allowed_admin_access_ip,
    ]
  }
}
