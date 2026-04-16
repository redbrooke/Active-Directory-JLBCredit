Stop-VM * -Force
Remove-VM * -Force

Remove-Item "C:\Hyper-V\Virtual Hard Disks\Lab\*" -Recurse -Force

Remove-VMSwitch -Name "LabSwitch" -Force