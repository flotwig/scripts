<#
.SYNOPSIS
Globally change settings for PuTTY sessions.
.PARAMETER setting
The name of the setting to change.
.PARAMETER value
The new value for the setting.
#>
Param(
    [Parameter(Mandatory=$true)] [string]$setting,
    [Parameter(Mandatory=$true)] [string]$value
)
Get-ChildItem HKCU:\Software\SimonTatham\PuTTY\Sessions\ | Foreach-Object {
    Set-ItemProperty -Path $_.Name.Replace('HKEY_CURRENT_USER','HKCU:') -Name $setting -Value $value
}