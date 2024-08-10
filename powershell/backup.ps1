#defining the main directory
$main_direc = "C:\Users\Administrator\Documents"
#defining the backup directory
$bacup_dir = "C:\backup"

$currentdate = Get-Date
$agedfiles = Get-ChildItem -Path $main_direc -File | Where-Object { 
    ($currentdate).AddDays(-1)
}

if (-not (Test-Path -Path $bacup_dir)) {
    New-Item -Path $bacup_dir -ItemType Directory
}

foreach ($file in $agedfiles) {
    Move-Item -Path $file.FullName -Destination $bacup_dir
    Write-Output "Moved: $($file.FullName) to backup directory"
}
