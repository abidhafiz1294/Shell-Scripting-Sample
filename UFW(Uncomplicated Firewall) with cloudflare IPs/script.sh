#!/bin/bash

# Allow all traffic from Cloudflare IPs (no ports restriction)
for cfip in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do ufw allow proto tcp from $cfip comment 'Cloudflare IP'; done

# when you run ufw reload > /dev/null, it silently reloads the UFW firewall rules without displaying any information or messages on the terminal.
# ufw reload > /dev/null

# OTHER EXAMPLE RULES
# Restrict to port 80
#for cfip in `cat /tmp/cf_ips`; do ufw allow proto tcp from $cfip to any port 80 comment 'Cloudflare IP'; done

# Restrict to port 443
#for cfip in `cat /tmp/cf_ips`; do ufw allow proto tcp from $cfip to any port 443 comment 'Cloudflare IP'; done

# Restrict to ports 80 & 443
for cfip in `cat /tmp/cf_ips`; do ufw allow proto tcp from $cfip to any port 80,443 comment 'Cloudflare IP'; done

# Clear existing UFW rules
# ufw --force reset

# Deny all incoming and outgoing traffic by default
ufw default deny incoming
ufw default deny outgoing

# Allow SSH (replace with your preferred SSH port)
ufw allow 22/tcp
ufw allow 2222/tcp
ufw allow ssh
# localhost rules
ufw allow from 192.168.1.0/24



# Enable UFW
ufw --force enable

# Show UFW status
ufw status

echo "UFW has been configured to allow traffic from Cloudflare IP ranges."
