resource "null_resource" "bootstrap" {
  count = length(var.server_ips)

  connection {
    host        = var.server_ips[count.index]
    type        = "ssh"
    private_key = var.ssh_private_key
  }

  provisioner "file" {
    source      = "${path.module}/scripts/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "DOCKER_VERSION=${var.docker_version} bash /root/bootstrap.sh"
    ]
  }
}

resource "null_resource" "config" {
  count = length(var.server_ips)

  connection {
    host        = var.server_ips[count.index]
    type        = "ssh"
    private_key = var.ssh_private_key
  }

  provisioner "file" {
    source      = "${path.module}/files/daemon.json"
    destination = "/etc/docker/daemon.json"
  }

  provisioner "remote-exec" {
    inline = [
      "systemctl start docker",
      "systemctl enable docker",
      "rm -rf /root/bootstrap.sh"
    ]
  }

  depends_on = [
    null_resource.bootstrap
  ]
}