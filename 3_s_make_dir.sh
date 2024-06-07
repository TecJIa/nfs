#!/bin/bash
sudo -i
mkdir -p /srv/share/upload
chown -R nobody:nogroup /srv/share
chmod 0777 /srv/share/upload
ls -la /srv/share/upload

