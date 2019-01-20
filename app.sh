#!/bin/bash
echo 1:open app1
echo 2:open app2
stty erase '^H' && read -p "Please choose:" do
case $do in
1)  stty erase '^H' && read -p "container name:" name
    pipework br3 $name 10.10.10.100/24@10.10.10.1
;;
2)  stty erase '^H' && read -p "container name:" name
    pipework br4 $name 10.10.20.100/24@10.10.20.1
;;
*) echo "You select number is not in the menu"
exit 1
;;
esac
