variable "hcloud_token" {
  type        = string
  sensitive   = true
  description = "Access token to Hetzner cloud"
}

variable "project" {
  type        = string
  description = "Name of the project the resources belong to"
}

variable "realm" {
  type        = string
  description = "Name of the realm of the project the resources belong to"
}

variable "node_image" {
  type        = string
  description = "Name or ID of the image to be used for the kubernetes nodes"
}

variable "node_ssh_pub" {
  type        = string
  description = "SSH public key string to access the kubernetes nodes"
}

variable "allowed_admin_access_ip" {
  type        = string
  description = "IPv4/IPv6 address which is allowed to pass the firewall to administration ports like 22 (SSH) and 6443 (Kubernetes control plane)"
}
