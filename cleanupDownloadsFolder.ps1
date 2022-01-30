$maxdays = 730
$maxsize = "100KB"
$downloadspath = "~/downloads"

$files = Get-ChildItem -Path $downloadspath -Recurse
$filesToDelete = $files | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$maxdays))} | Where-Object {$_.Length -gt $maxsize} 
Write-Host The following files will be deleted $filesToDelete
$filesToDelete | Remove-Item -WhatIf