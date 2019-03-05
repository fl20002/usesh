#!/bin/bash
echo 1:open 
echo 2:close
echo 3:status 
stty erase '^H' && read -p "Please choose:" do
case $do in
1) sed -i 's/PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config
   echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
   /etc/init.d/ssh restart
;;
2) sed -i 's/PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config
   echo "PermitRootLogin no" >> /etc/ssh/sshd_config
   /etc/init.d/ssh restart
;;
3) tail -n 1 /etc/ssh/sshd_config
;; 
*) echo "You select number is not in the menu"
exit 1
;;
esac
