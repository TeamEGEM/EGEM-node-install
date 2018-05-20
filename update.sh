#!/bin/bash

pkill screen
cd ~/go-egem
make clean
git pull
make all
cd ~/go-egem && screen -dmS go-egem /root/go-egem/build/bin/egem --datadir ~/live-net/ --rpc
