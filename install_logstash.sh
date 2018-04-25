#!/bin/bash

APTELASTIC="deb https://artifacts.elastic.co/packages/6.x/apt stable main"
APTORACLE="deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
APTPROXY="Acquire::http::Proxy "http://squid.internal:3128";"

echo ${APTELASTIC} | sudo tee /etc/apt/sources.list.d/elastic.list
echo ${APTORACLE} | sudo tee /etc/apt/sources.list.d/oracle.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D27D666CD88E42B4
echo ${APTPROXY} | sudo tee /etc/apt/apt.conf.d/20proxy

sudo apt update
sudo apt install oracle-java8-set-default oracle-java8-installer logstash

