#!/bin/bash
sudo -i
echo "/srv/share 192.168.56.102/32(rw,sync,root_squash)" >> "/etc/exports"
exportfs -r
sleep 5
exportfs -s
sleep 10
cat /etc/exports
