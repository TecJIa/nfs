#!/bin/bash
sudo -i
echo "192.168.56.101:/srv/share/ /mnt nfs vers=3,noauto,x-systemd.automount 0 0" >> "/etc/fstab"
systemctl daemon-reload
sleep 5
systemctl restart remote-fs.target
sleep 7
cd /mnt/
mount | grep mnt
