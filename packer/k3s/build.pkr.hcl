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

  provisioner "shell" {
    inline = [
      "wget -O ./k3s 'https://github.com/k3s-io/k3s/releases/download/${var.K3S_VERSION}/k3s'",
      "wget -O ./k3s.hashsums.txt 'https://github.com/k3s-io/k3s/releases/download/${var.K3S_VERSION}/sha256sum-amd64.txt'",
      "sha256sum -c ./k3s.hashsums.txt --ignore-missing",
      "mv ./k3s /usr/bin/k3s",
    ]
  }
}
