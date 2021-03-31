#!/bin/bash
sudo apt update
sudo apt-get install default-jre -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update
sudo apt-get install elasticsearch
sudo cat <<EOF >> /etc/elasticsearch/elasticsearch.yml
network.host: 0.0.0.0
http.cors.enabled: true
http.cors.allow-origin: "*"
EOF

sudo cat <<EOF >> /etc/elasticsearch/jvm.options
-Xms128m
-Xmx128m
EOF
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

