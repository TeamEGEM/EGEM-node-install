# ![Ethergem](https://github.com/TeamEGEM/meta/blob/master/images/140x140.png)
# Install Egem Node
This script is to install a Ethergem node on your own vps.
It has been testing on a $5 [Vultr VPS](https://www.vultr.com/?ref=7307426).

Requirements

Ubuntu 16.04 LTS

Install without Swap
```
bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/setup.sh)"
```
Install with Swap
```
bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/createswap.sh)" && bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/setup.sh)"
```

During the process you will be promted to type in some details for your node.

Node Name and Contact Details.

During the install process there is a 5 min sleep before activiating the node on the Net- Intelligence page. 
It is a not so fool proof way of allowing the new node to catch up to the current block/ sync. 
After the instalation is complete you will be prompted with a complete message an the network.egem.io link. 
If all went well when you visit the page you should see your newly created node on the page. 

*** Note after setup if you notice that your node is red it could be due to not being fully sysnced with the current block height. Give it a few min to catch up and you should be good to go.
If you have any trouble feel free to ask for help on the Official Egem discord. 

# To update go-egem
```
cd go-egem
make clean
git pull
make all
```

# To add your new node to the bootnode list.
```screen -ls
screen -r go-egem
ctrl+c to kill
/root/go-egem/build/bin/egem --datadir ~/live-net/ --rpc
```
When you boot up go-egem there is a line that looks like this:

* self=enode://02cae3b86ae74b64b8766bb177ff4578cc51a18ad5b1b3df1304faef5e39bcb928d3308ca9991ef8aeedc5b7124eb0dca7b0bc74a5f682b13662a98112426057@[::]:30666  
You remove the self= and then inside of the [::] at the end you replace it with your outside IP address.

So it should look something like this when done:

* enode://02cae3b86ae74b64b8766bb177ff4578cc51a18ad5b1b3df1304faef5e39bcb928d3308ca9991ef8aeedc5b7124eb0dca7b0bc74a5f682b13662a98112426057@[154.34.678.12]:30666

submit pull request
```
cd ~/live-net/egem/static-nodes.json
wget https://raw.githubusercontent.com/TeamEGEM/EGEM-Bootnodes/master/static-nodes.json
```
then run
```
cd ~/go-egem && screen -dmS go-egem /root/go-egem/build/bin/egem --datadir ~/live-net/ --rpc
```
