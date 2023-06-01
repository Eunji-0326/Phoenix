# 정방향 조회 도메인 만들기 => 이미 만들어져있음
# Add-DnsServerPrimaryZone -Name "vclass.local" -ZoneFile "vclass.local.dns" 

# 역방향 조회 도메인 만들기  => 주석에서 한글 사용 시 끝에 공백 추가하기!!!
Add-DnsServerPrimaryZone -NetworkID 10.10.10.0/24 -ZoneFile "10.10.10.in-addr.arpa.dns"

# DNS 포워딩 
# Add-DnsServerForwarder -IPAddress 200.200.200.245 -PassThru

# Domain Controller Record
Add-DnsServerResourceRecordA -Name "sa-vcsa-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.10"
Add-DnsServerResourceRecordPtr -Name "10" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-vcsa-01.vclass.local"

Add-DnsServerResourceRecordA -Name "sa-esxi-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.11"
Add-DnsServerResourceRecordPtr -Name "11" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-01.vclass.local"

Add-DnsServerResourceRecordA -Name "sa-esxi-02" -ZoneName "vclass.local" -IPv4Address "10.10.10.12"
Add-DnsServerResourceRecordPtr -Name "12" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-02.vclass.local"

Add-DnsServerResourceRecordA -Name "sa-esxi-03" -ZoneName "vclass.local" -IPv4Address "10.10.10.13"
Add-DnsServerResourceRecordPtr -Name "13" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-03.vclass.local"
