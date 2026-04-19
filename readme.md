# How to run this script:

ansible-playbook -i inventory.ini site.yml

Username: JLBCredit\JeremyUsbourne
Password: Password123!


# First time box setup.

Grab the Windows Server 2022 VHD from here - https://www.microsoft.com/en-us/evalcenter/download-windows-server-2022?msockid=3d56fdd29d636fa22c85e8a19cd86e3e

From the VM host:

.\VBoxManage.exe internalcommands sethduuid "C:\Users\user\Documents\GitHub\Active-Directory-JLBCredit\

They depoloy the VM in VirtualBox with a Host-Only adapter. 

On the device itself:

%WINDIR%\system32\sysprep\sysprep.exe /generalize /shutdown /oobe

Enable-PSRemoting -Force

mstsc for testing. 

Consider changing inventory.ini and adding the IP address assigned to this host. 

