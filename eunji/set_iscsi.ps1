# Set disk online
$disknum = 1 # or 2
Set-disk -Number -IsOffline $false

Initialize-Disk -Number $disknum -PartitionStyle mbr

Initialize-Disk -DiskNumber $disknum -UseMaximunSize | Format-Volume -FileSystem ntfs

Get-Partition -DiskNumber 1 | Set-Partition -NewDriveLetter G

