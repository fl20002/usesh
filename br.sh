#!/bin/bash
echo 1:vmbr4
echo 2:vmbr5
echo 3:vmbr6
stty erase '^H' && read -p "Please choose:" do
case $do in
1) stty erase '^H' && read -p "container name:" name
   stty erase '^H' && read -p "num:" num
   pipework vmbr4 $name 10.10.10.$num/24@10.10.10.1
;;
2) stty erase '^H' && read -p "container name:" name
   stty erase '^H' && read -p "num:" num
   pipework vmbr5 $name 10.10.20.$num/24@10.10.20.1
;;
3) stty erase '^H' && read -p "container name:" name
   stty erase '^H' && read -p "num:" num
   pipework vmbr6 $name 10.10.30.$num/24@10.10.30.1
;;
*) echo "You select number is not in the menu"
exit 1
;;
esac
