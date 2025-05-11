#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Data: 10/05/2025
# Consegna: Rif. consegna sul classroom (Web e servizi)
# by jim_bug // :)


wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.30/xampp-linux-x64-8.0.30-0-installer.run
chmod +x xampp-linux-x64-8.0.30-0-installer.run
sudo ./xampp-linux-x64-8.0.30-0-installer.run --mode text

sudo tee /etc/systemd/system/xampp.service <<EOF
[Unit]
Description=XAMPP service
After=network.target

[Service]
Type=forking
ExecStart=/opt/lampp/xampp start
ExecStop=/opt/lampp/xampp stop
ExecReload=/opt/lampp/xampp restart
User=root
Group=root

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable xampp.service
sudo systemctl start xampp.service
sudo systemctl status xampp.service


mkdir php 2> /dev/null
sudo ln -s "/home/$(whoami)/php" /opt/lampp/htdocs/php


# // :)


