# ========= CONFIG =========
$ServerVHD = "C:\Users\user\Documents\GitHub\Active-Directory-JLBCredit\server.vhd"
$ClientVHD = "C:\Users\user\Documents\GitHub\Active-Directory-JLBCredit\client.vhd"
$SwitchName = "LAB-SWITCH"

# ========= CREATE SWITCH =========
if (-not (Get-VMSwitch -Name $SwitchName -ErrorAction SilentlyContinue)) {
    New-VMSwitch -Name $SwitchName -NetAdapterName "Ethernet" -AllowManagementOS $true
}

# ========= HELPER FUNCTION =========
function New-LabVM {
    param (
        $Name,
        $MemoryGB = 1,
	$VHDPath
    )

    $MemoryBytes = [int64]($MemoryGB * 1GB)

    # Create VM
    New-VM -Name $Name `
        -MemoryStartupBytes $MemoryBytes `
        -Generation 1 `
        -VHDPath $VHDPath `
        -SwitchName $SwitchName | Out-Null

    Set-VMProcessor -VMName $Name -Count 1

    Connect-VMNetworkAdapter -VMName $name -SwitchName "LAB-SWITCH"

    Start-VM $Name

    Write-Host "Created $Name"
}

# ========= CREATE VMs =========

# Root DC
New-LabVM -Name "JLB-DC" -MemoryGB 2 -VHDPath $ServerVHD

# Workstation
New-LabVM -Name "JLB-WS" -MemoryGB 2 -VHDPath $ClientVHD

Get-VMNetworkAdapter -VMName "*" | Select -ExpandProperty IPAddresses

Write-Host @' Make these configs:

New-NetIPAddress `\r\n  -InterfaceAlias "vEthernet (LAB-SWITCH)" `\r\n  -IPAddress 10.0.0.1 `\r\n  -PrefixLength 24\r\n\r\nNew-NetIPAddress `\r\n  -InterfaceAlias "Ethernet" `\r\n  -IPAddress 10.0.0.10 `\r\n  -PrefixLength 24\r\n\r\nNew-NetIPAddress `\r\n  -InterfaceAlias "Ethernet" `\r\n  -IPAddress 10.0.0.11 `\r\n  -PrefixLength 24
'@