source "hyperv-iso" "winclient" {
  iso_url = "C:/ISO/Windows10.iso"

  communicator = "winrm"
  winrm_username = "Administrator"
  winrm_password = "Password123!"
}