# docker package apt-key download and add
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add

# set docker key
sudo apt-key fingerprint OEBFCD88

# docker repository add and update
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

# docker package install
sudo apt install docker-ce docker-ce-cli containerd.io -y

# docker daemon start and enable
sudo systemctl enable docker
sudo systemctl start docker