#!/usr/bin/env bash
#Script that configures the web servers to serve  web_static.
server="\n\tlocation /web_static {\n\t\talias /data/web_static/current/;\n\t}"
file="/etc/nginx/sites-available/default"
sudo apt-get update -y
sudo apt-get install nginx -y
sudo mkdir -p "/data/web_static/shared/"
sudo mkdir -p "/data/web_static/releases/test/"
echo "My Nginx" > "/data/web_static/releases/test/index.html"
rm -f "/data/web_static/current"; ln -s "/data/web_static/releases/test/" "/data/web_static/current"
sudo chown -hR ubuntu:ubuntu "/data/"
sudo sed -i "29i\ $server" "$file"
sudo service nginx restart
exit 0
