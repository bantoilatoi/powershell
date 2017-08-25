Clear-Host
$x86 = "%SYSTEMROOT%\System32\OneDriveSetup.exe"
$x64 = "%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe"
Write-Host 'Close Onedrive process'
Get-Process
Ping 127.0.0.1  > NULL 2>&1
