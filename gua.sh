#!/bin/bash
echo 1:mount
echo 2:umonut
echo 3:status
stty erase '^H' && read -p "Please choose:" do
case $do in
1)  stty erase '^H' && read -p "need username:" name
    stty erase '^H' && read -p "need password:" pass
    mount -t cifs -o username=$name,password=$pass,vers=3.0 //home/home/data  /data
;;
2)  umount /data
;;
3)  df -h
;;
*) echo "You select number is not in the menu"
exit 1
;;
esac
