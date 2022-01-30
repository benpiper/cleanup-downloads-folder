# cleanup-downloads-folder

PowerShell script to clean up your messy Windows folders.

## Usage

Edit the configuration parameters in [cleanupDownloadsFolder](cleanupDownloadsFolder.ps1).

`$mindays = 60`

The minimum age of files to delete.

`$minsize = "0KB"`

The minimum size of files to delete.

`$downloadspath = @("~/downloads", "~/desktop")`

The path(s) to delete files from. The script will recurse into subdirectories.

`$extensions = @("*.exe", "*.msi", "*.zip", "*.iso", "*.7z", "*.gz", "*.tmp", "*.qcow2", "*.mp3", "*.pem")`

File extensions to include. To include all files, set `#$extensions = @("*")`

`$paranoid = $false`

If set to $true, uses `cipher.exe` to wipe free space after deleting files.

`$WhatIfPreference = $true`

Safety switch to prevent accidentally deleting files. Set to `$false` to have the script delete files for real.
