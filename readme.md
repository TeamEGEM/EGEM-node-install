This script is to install a Ethergem node on your own vps.
It has been testing on a $5 Linode VPS.
A video of how to use this script can be found at [youtube](https://youtu.be/vLSzmF758Kk)

Requirements

Ubuntu 16.04 LTS



Using the Script

Copy the contents from the setup.sh file in this Repo to your clipboard.
SSH into your newly created box and and cd into your home directory. 

cd ~/

From there create a new file by typing

nano setup.sh

paste the the script into this new file.

exit nano by pressing control + x
press Y to save

next we need to make the script executable. So run the following command.

chmod +x setup.sh

Now we are ready to run the script. During the install process there will be minimal interaction needed. 

To execute the start or the script run the following command.

source setup.sh; step1

The script is a 2 part processes. Once the first part is complete you will be prompted to execute a secind command.

source setup.sh; step2

During the step 2 process you will be promted to type in some details for your node.

Node Name and Contact Details.

During the Step2 of the install process there is a 5 min sleep before activiating the node on the Net- Intelligence page. 
It is a not so fool proof way of allowing the new node to catch up to the current block/ sync. 
After the instalation is complete you will be prompted with a complete message an the network.egem.io link. 
If all went well when you visit the page you should see your newly created node on the page. 

*** Note after setup if you notice that your node is red it could be due to not being fully sysnced with the current block height. Give it a few min to catch up and you should be good to go.
If you have any trouble feel free to ask for help on the Official Egem discord. 
