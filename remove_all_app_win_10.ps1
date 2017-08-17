Clear-Host
$pathfileMyApps = "$env:userprofile\Desktop\myapps.txt"
if((Test-Path -Path $pathfileMyApps) -eq $False ){
    write-host 'Create file myapps.txt'
    $Location = "$env:userprofile\Desktop\"
    New-Item -Path $Location -Name "myapps.txt" -ItemType File
    Remove-Item $pathfileMyApps -Recurse -Force -ErrorAction
}

Get-AppxPackage | Select PackageFullName > $pathfileMyApps
$reader = [System.IO.File]::OpenText($pathfileMyApps)
while($null -ne ($line = $reader.ReadLine())) {
	remove-AppxProvisionedPackage -online -packagename $line
	remove-AppxPackage -package $line
}
try
{
	Remove-Item $pathfileMyApps -Recurse -Force -ErrorAction
}
catch
{
  write-host 11111
}


