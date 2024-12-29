source "hcloud" "k3s" {
  token = var.TOKEN
  image = "ubuntu-24.04"
  location  = "fsn1"      # nbg1: Nuremberg, fsn1: Falkenstein
  server_type = "cx22"
  ssh_username  = "root"
  snapshot_name = "${var.PROJECT}-k3s-${formatdate("DD-MM-YYYY-hh-mm-ss", timestamp())}-${var.VERSION}"
  snapshot_labels = {
    name = "k3s"
    version = var.VERSION
  }
}

build {
  name  = "k3s"

  sources = [
    "source.hcloud.k3s",
  ]
}
