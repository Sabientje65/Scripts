<#
    Kill the process using the given local port
#>
param(
    [Parameter(Mandatory=$true)]
    [Int32]$localPort
)

$connection = Get-NetTCPConnection -LocalPort $localPort;
$process = Get-Process -Id $connection.OwningProcess;

Write-Host "Killing process with id:" $process.Id " running on local port:" $localPort;
$process.Kill();