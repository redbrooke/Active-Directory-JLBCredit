$VMPath = "C:\HyperV\Lab"

$VMs = @(
"LON-DC-1","FFM-DC-1","DC-00",
"LON-JUMP-1",
"LON-WS-1","LON-WS-2",
"WS-00","WS-01"
)

foreach ($vm in $VMs) {

    # Stop VM if running
    if (Get-VM -Name $vm -ErrorAction SilentlyContinue) {
        Stop-VM $vm -Force -ErrorAction SilentlyContinue

        # Remove checkpoints (VERY IMPORTANT)
        Get-VMSnapshot -VMName $vm -ErrorAction SilentlyContinue | Remove-VMSnapshot -Confirm:$false

        # Remove VM
        Remove-VM $vm -Force
    }

    # Remove differencing disk
    $vhd = "$VMPath\$vm.vhd"

    if (Test-Path $vhd) {
        Remove-Item $vhd -Force
        Write-Host "Deleted disk: $vhd"
    }
}

Write-Host "`nLab fully destroyed (VMs + disks)."