<#
.SYNOPSIS
This script reads the existing Windows PATH variable and reconciles the many inconsistencies which
arise from all the factors that mess with the PATH.
#>
$paths = $env:Path -Split ";" | Sort-Object -Unique | Where-Object {
    Test-Path $_
}
[string] $paths.Count + " paths in path"
$pathsString = $paths -Join ";"
$env:Path = $pathsString;
[Environment]::SetEnvironmentVariable("Path",$pathsString,[EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("INCLUDE",$pathsString,[EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("Path",$pathsString+";C:\bin",[EnvironmentVariableTarget]::Machine)