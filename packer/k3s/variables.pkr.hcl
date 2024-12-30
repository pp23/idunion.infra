variable "PROJECT" {
  type = string
  description = "Name of the project this image belongs to"
}

variable "TOKEN" {
  type  = string
  description = "HCloud API-Token"
}

variable "VERSION" {
  type  = string
  description = "Unique version which identifies this snapshot in terraform via tags"
}

variable "K3S_VERSION" {
  type = string
  description = "Version of k3s to install"
}

variable "K3S_SYSTEMD_SERVICE_FILE" {
  type = string
  description = "k3s systemd service file to install"
}
