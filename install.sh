#!/bin/bash


echo "Installation"
cp *.sh /local/AndroidSDK/tools/
cd /local/AndroidSDK/tools/
chmod +x *.sh
rm -rf install.sh
read -p "Installation fini ! Appuyer sur ENTRER" x