#!/bin/sh
apt-get update
apt-get install -y python unzip python-twisted python-openssl python-setuptools intltool python-xdg python-chardet geoip-database python-libtorrent python-notify python-pygame python-glade2 librsvg2-common xdg-utils python-mako

wget http://download.deluge-torrent.org/source/deluge-1.3.15.tar.gz
tar -xzvf deluge-1.3.15.tar.gz
cd deluge-1.3.15

python setup.py build
python setup.py install --install-layout=deb
python setup.py clean -a

wget -O  /etc/systemd/system/deluged.service https://raw.githubusercontent.com/fl20002/usesh/master/deluge/deluged.service
wget -O  /etc/systemd/system/deluge-web.service https://raw.githubusercontent.com/fl20002/usesh/master/deluge/deluge-web.service

systemctl enable deluged
systemctl enable deluge-web
systemctl start deluged
systemctl start deluge-web
