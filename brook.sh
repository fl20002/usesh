#!/bin/bash
echo 1:download
echo 2:check
echo 3:open
echo 4:close
stty erase '^H' && read -p "Please choose:" do
case $do in
1) ver=$(wget -qO- "https://github.com/txthinking/brook/tags"| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//') && echo ${brook_ver}
   wget -O /root/brook https://github.com/txthinking/brook/releases/download/$ver/brook
   chmod +x /root/brook
;;
2) ps -ef|grep brook
;;
3) stty erase '^H' && read -p "forwarding port:" port
   stty erase '^H' && read -p "forwarding addr:" addr
   cd /root
   nohup /root/brook relay -l :$port -r $addr > /dev/null 2>&1 &
;;
4) killall -9 brook
;;
*) echo "You select number is not in the menu"
exit 1
;;
esac
