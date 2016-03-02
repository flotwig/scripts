<#
.SYNOPSIS
One-liner to import PuTTY settings from OneDrive to the registry.
#>
$onedrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\OneDrive\" -Name UserFolder).UserFolder
regedit /e "$onedrive\putty.reg" HKEY_CURRENT_USER\Software\SimonTatham