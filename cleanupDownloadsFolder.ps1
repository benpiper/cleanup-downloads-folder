$mindays = 60
$minsize = "0KB"
$downloadspath = "~/downloads"  # Will recurse into subdirectories
$extensions = @("*.exe", "*.msi", "*.zip", "*.iso", "*.7z", "*.gz", "*.tmp", "*.qcow2", "*.mp3", "*.pem")
#$extensions = @("*")  # For all files
$paranoid = $false  # Wipe free space after deleting files
$WhatIfPreference = $false  # Safety switch to prevent accidentally deleting files. Set to $false to have the script delete files for real.

$files = Get-ChildItem -Include $extensions -Path $downloadspath -Recurse
$filesToDelete = $files | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$mindays))} | Where-Object {$_.Length -gt $minsize} 
Write-Host Matching files: $filesToDelete.Name | Sort-Object
Write-Host $filesToDelete.Count files will be deleted.
$filesToDelete | Remove-Item

if ($paranoid) {
    cipher /w:$downloadspath &
}
