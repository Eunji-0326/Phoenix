# https://www.server-world.info/en/note?os=Windows_Server_2019&p=iscsi&f=1
# https://learn.microsoft.com/ko-kr/powershell/module/iscsitarget/?view=windowsserver2019-ps
# https://www.server-world.info/en/note?os=Windows_Server_2019&p=iscsi&f=3
# https://learn.microsoft.com/ko-kr/powershell/module/iscsitarget/new-iscsiservertarget?view=windowsserver2022-ps
# https://learn.microsoft.com/ko-kr/powershell/module/iscsitarget/new-iscsivirtualdisk?view=windowsserver2019-ps
# https://learn.microsoft.com/ko-kr/powershell/module/iscsitarget/set-iscsiservertarget?view=windowsserver2022-ps
# https://learn.microsoft.com/ko-kr/powershell/module/iscsitarget/add-iscsivirtualdisktargetmapping?view=windowsserver2019-ps
# https://learn.microsoft.com/en-us/powershell/module/storage/set-disk?view=windowsserver2022-ps
# https://learn.microsoft.com/en-us/powershell/module/storage/initialize-disk?view=windowsserver2022-ps
# https://learn.microsoft.com/en-us/powershell/module/storage/set-partition?view=windowsserver2022-ps
# https://learn.microsoft.com/en-us/powershell/module/storage/get-partition?view=windowsserver2022-ps
# https://learn.microsoft.com/en-us/powershell/module/storage/format-volume?view=windowsserver2022-ps
# https://tiprelay.com/%EC%9C%88%EB%8F%84%EC%9A%B010%EC%97%90%EC%84%9C-powershell%EB%A1%9C-%EB%93%9C%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%A5%BC-%ED%8F%AC%EB%A7%B7%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95/

$driveletter = Z
$targetname = "iscsi-test"
$diskpath = $driveletter + ":\iSCSIDisk\test-LUN0.vhdx"
$disksize = 100GB

# create iSCSI Target
New-IscsiServerTarget -TargetName $targetname -InitiatorId @("IPAddress:10.10.11.14","IPAddress:10.10.11.15","IPAddress:10.10.11.16")

# create iSCSI virtual disk
New-IscsiVirtualDisk -Path $diskpath -SizeBytes $disksize 

# assign iSCSI virtual disk to iSCSI Target
Add-IscsiVirtualDiskTargetMapping -TargetName $targetname -Path $diskpath

# confirm settings
Get-IscsiServerTarget -TargetName $targetname 

# restart service
Restart-Service -Name $targetname