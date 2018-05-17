#!/bin/bash

echo '
      ___           ___           ___           ___     
     /\__\         /\__\         /\__\         /\  \    
    /:/ _/_       /:/ _/_       /:/ _/_       |::\  \   
   /:/ /\__\     /:/ /\  \     /:/ /\__\      |:|:\  \  
  /:/ /:/ _/_   /:/ /::\  \   /:/ /:/ _/_   __|:|\:\  \ 
 /:/_/:/ /\__\ /:/__\/\:\__\ /:/_/:/ /\__\ /::::|_\:\__\
 \:\/:/ /:/  / \:\  \ /:/  / \:\/:/ /:/  / \:\~~\  \/__/
  \::/_/:/  /   \:\  /:/  /   \::/_/:/  /   \:\  \      
   \:\/:/  /     \:\/:/  /     \:\/:/  /     \:\  \     
    \::/  /       \::/  /       \::/  /       \:\__\    
     \/__/         \/__/         \/__/         \/__/    
      ___           ___                         ___     
     /\  \         /\  \         _____         /\__\    
     \:\  \       /::\  \       /::\  \       /:/ _/_   
      \:\  \     /:/\:\  \     /:/\:\  \     /:/ /\__\  
  _____\:\  \   /:/  \:\  \   /:/  \:\__\   /:/ /:/ _/_ 
 /::::::::\__\ /:/__/ \:\__\ /:/__/ \:|__| /:/_/:/ /\__\
 \:\~~\~~\/__/ \:\  \ /:/  / \:\  \ /:/  / \:\/:/ /:/  /
  \:\  \        \:\  /:/  /   \:\  /:/  /   \::/_/:/  / 
   \:\  \        \:\/:/  /     \:\/:/  /     \:\/:/  /  
    \:\__\        \::/  /       \::/  /       \::/  /   
     \/__/         \/__/         \/__/         \/__/    '


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

echo "Intalling fail2ban"
sudo apt install fail2ban

echo "Installing Firewall"
sudo apt install ufw -y
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow 8545/tcp
ufw allow 30666/tcp
ufw allow 30661/tcp
ufw logging on
ufw --force enable

echo "Install go-lang"
sudo apt-get install golang-1.10 -y
sudo ln /usr/lib/go-1.10/bin/go /usr/bin/go

echo "Clone and Compile Go-Egem"
git clone https://github.com/TeamEGEM/go-egem.git
cd go-egem && make egem
cd ~/go-egem && screen -dmS go-egem /root/go-egem/build/bin/egem --datadir ~/live-net/ --rpc

echo "Installing node and pm2"
cd ~
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs && sudo npm install -g pm2

echo "Cloning EGEM Net-Intelligence"
git clone https://github.com/TeamEGEM/egem-net-intelligence-api.git

#source setup.sh; step2

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
echo '
 ______   ______     __     ______   ______     ______     ______     ______    
/\__  _\ /\  == \   /\ \   /\  ___\ /\  __ \   /\  == \   /\  ___\   /\  ___\   
\/_/\ \/ \ \  __<   \ \ \  \ \  __\ \ \ \/\ \  \ \  __<   \ \ \____  \ \  __\   
   \ \_\  \ \_\ \_\  \ \_\  \ \_\    \ \_____\  \ \_\ \_\  \ \_____\  \ \_____\ 
    \/_/   \/_/ /_/   \/_/   \/_/     \/_____/   \/_/ /_/   \/_____/   \/_____/ 
    
    '
