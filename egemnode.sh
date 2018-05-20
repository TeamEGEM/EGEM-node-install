#!/bin/bash
while true
do
  clear
  echo "=========================="
  echo "Egem Node Installer v1.337"
  echo "=========================="
  echo "Enter 1 to Install Egem Node with Swap File: "
  echo "Enter 2 to Install Egem Node without Swap File: "
  echo "Enter 3 to Updated Egem Node: "
  echo "Enter q to exit this menu: "
  echo -e "\n"
  echo -e "Enter your selection \c"
  read answer
  case "$answer" in
    1) bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/createswap.sh)" && bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/setup.sh)" ;;
    2) bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/setup.sh)" ;;
    3) bash -c "$(wget -O - https://raw.githubusercontent.com/buzzkillb/EGEM-node-install/master/update.sh)" ;;
    q) exit ;;
  esac
  echo -e "Enter return to continue \c"
  read input
done
