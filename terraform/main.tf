resource "null_resource" "dc1" {
  provisioner "local-exec" {
    command = "powershell -File hyperv.ps1 DC1"
  }
}

resource "null_resource" "dc2" {
  provisioner "local-exec" {
    command = "powershell -File hyperv.ps1 DC2"
  }
}

resource "null_resource" "dc3" {
  provisioner "local-exec" {
    command = "powershell -File hyperv.ps1 DC3"
  }
}

resource "null_resource" "client" {
  provisioner "local-exec" {
    command = "powershell -File hyperv.ps1 CLIENT"
  }
}