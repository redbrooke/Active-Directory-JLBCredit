source "hyperv-iso" "winserver" {
  iso_url      = "C:/ISO/WindowsServer2022.iso"
  communicator = "winrm"
  winrm_username = "Administrator"
  winrm_password = "Password123!"

  vm_name = "template-winserver"
}

build {
  sources = ["source.hyperv-iso.winserver"]

  provisioner "powershell" {
    inline = [
      "Enable-PSRemoting -Force",
      "Set-ExecutionPolicy Bypass -Force"
    ]
  }
}