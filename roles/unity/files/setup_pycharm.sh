#! /bin/sh

# Downloads a specific version of pycharm and installs it to the expected location
mkdir -p /opt/jetbrains/pycharm

wget https://download.jetbrains.com/python/pycharm-professional-4.5.1.tar.gz -O pycharm.tar.gz

tar -xzf pycharm.tar.gz -C /opt/jetbrains/pycharm
rm pycharm.tar.gz
