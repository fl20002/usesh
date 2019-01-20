#!/bin/bash
echo 1:check
echo 2:open
echo 3:close
stty erase '^H' && read -p "Please choose:" do
case $do in
1) ip -6 route show
;;
2) stty erase '^H' && read -p "interfaces:" name
   stty erase '^H' && read -p "IPv6 address suffix:" addr
   ip -f inet6 neigh add proxy $addr dev $name
   ip -f inet6 route add $addr dev vmbr0
;;
3) stty erase '^H' && read -p "interfaces:" name
   stty erase '^H' && read -p "IPv6 address suffix:" addr
   ip -f inet6 neigh delete proxy $addr dev $name
   ip -f inet6 route delete $addr dev vmbr0
;;
*) echo "You select number is not in the menu"
exit 1
;;
esac
