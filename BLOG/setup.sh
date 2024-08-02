#!/bin/bash

cd /opt/BLOG

python -m venv venv
source venv/bin/activate

/opt/BLOG/venv/bin/python -m pip install --upgrade pip
pip install --no-cache-dir -r requirements.txt

chmod a=rx /opt/BLOG/setu*.sh
./setup_ROBOTS.sh
./setup_HUMANS.sh
./setup_SITEMAP.sh
#./setup_FIREWALL.sh #RUN AS ROOT

#mkdocs new ./mkdocs_DATA
cd mkdocs_DATA

mkdocs serve
#sudo firewall-cmd --remove-port=8000/tcp
#sudo firewall-cmd --remove-port=8000/udp
