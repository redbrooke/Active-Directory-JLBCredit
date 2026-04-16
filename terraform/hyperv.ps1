param([string]$vmName)

$template = "template-winserver"
if ($vmName -eq "CLIENT") {
    $template = "template-winclient"
}

$newName = "$vmName-lab"

# Clone VM
Copy-VMFile -Name $template -DestinationPath "C:\VMs\$newName"

# Create VM
New-VM -Name $newName -MemoryStartupBytes 4GB -Generation 2 -SwitchName "Default Switch"

Start-VM -Name $newName