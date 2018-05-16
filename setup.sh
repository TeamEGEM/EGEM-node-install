#!/bin/bash

#source setup.sh; step1
echo "Updating linux packages"
echo "If prompted about Grub Configuration select keep the local version currently installed"
sleep 10
apt-get update && apt-get upgrade -y && apt-get -f install

echo "Installing build-essential"
apt-get install -y build-essential

echo "Intalling screen"
apt install screen

echo "Installing git"
apt install git -y

echo "Install go-lang"
wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
mkdir -p ~/go; echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin" >> ~/.bashrc 
source ~/.bashrc
echo "export && GOROOT=/usr/local/go"
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH"

echo "Installing node and pm2"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs && sudo npm install -g pm2

echo "Cloning go-egem Repo"
sleep 5
git clone https://github.com/TeamEGEM/go-egem.git

echo "Cloning EGEM Net-Intelligence"
sleep 5
git clone https://github.com/TeamEGEM/egem-net-intelligence-api.git

#source setup.sh; step2
sleep 5
cd ~/go-egem && make egem
cd ~/go-egem && screen -dmS go-egem /root/go-egem/build/bin/egem --datadir ~/live-net/ --rpc

echo -n "What woud you like to name your instance? (Example: TeamEGEM Node East Coast USA)"
read INSTANCE_NAME
name=$(echo $INSTANCE_NAME)

echo -n "What is your node's contact details? (Example: Twitter:@TeamEGEM)"
read CONTACT_DETAILS
details=$(echo $CONTACT_DETAILS)

sed -i '17s/.*/      "INSTANCE_NAME"   : '"'$name'"',/' ~/egem-net-intelligence-api/app.json
sed -i '18s/.*/      "CONTACT_DETAILS" : '"'$details'"',/' ~/egem-net-intelligence-api/app.json
sed "s/'/\"/g" ~/egem-net-intelligence-api/app.json

echo "This is the tricky part need to wait for chain to sync b4 connecting to the the network page"
echo "Go get some food and come back in 5 min"
echo "A more efficient way will eventually be implemented"

sleep 300

cd ~/egem-net-intelligence-api && sudo npm install
pm2 start app.json

echo "Done your node should be listed on https://network.egem.io"

