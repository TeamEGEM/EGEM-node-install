This script is to install a Ethergem node on your own vps.
It has been testing on a $5 Linode VPS.
A video of how to use this script can be found at [youtube](https://youtu.be/vLSzmF758Kk)

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
