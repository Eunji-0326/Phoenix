kubeadm token create

token=$(kubeadm token list | awk 'NR==2{print $1}')

echo "$token" > /home/phoenix/token/token.txt

sha256_hash=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //')
echo "$sha256_hash" >> /home/phoenix/token/token.txt


# 토큰을 worker로 복사
apt install -y expect

expect << EOF
spawn scp -o "StrictHostKeyChecking=no" /home/phoenix/token/token.txt phoenix@10.10.13.3:/home/phoenix/token.txt
expect "password:" {send "VMware1!\r"}
expect eof

spawn scp -o "StrictHostKeyChecking=no" /home/phoenix/token/token.txt phoenix@10.10.13.4:/home/phoenix/token.txt
expect "password:" {send "VMware1!\r"}
expect eof

spawn scp -o "StrictHostKeyChecking=no" /home/phoenix/token/token.txt phoenix@10.10.13.5:/home/phoenix/token.txt
expect "password:" {send "VMware1!\r"}
expect eof
EOF
