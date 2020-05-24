variable "do_token" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_volume" "volume" {
  name   = "storage"
  region = "fra1"
  size = 10
}

resource "digitalocean_droplet" "serverApp" {
    image = "centos-7-x64"
    name = "serverApp"
    region = "fra1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
      var.ssh_fingerprint
    ]
}

resource "digitalocean_droplet" "serverDb" {
    image = "centos-7-x64"
    name = "serverDb"
    region = "fra1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
      var.ssh_fingerprint
    ]
}
resource "digitalocean_volume_attachment" "mysql" {
  droplet_id = digitalocean_droplet.serverDb.id
  volume_id  = digitalocean_volume.volume.id
}