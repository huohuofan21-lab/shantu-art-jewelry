#!/usr/bin/env bash
set -euo pipefail

DOMAIN="${1:-example.com}"
SITE_DIR="/var/www/crystal-jewelry-site"

sudo apt-get update
sudo apt-get install -y nginx certbot python3-certbot-nginx

sudo mkdir -p "$SITE_DIR"
sudo rm -f /etc/nginx/sites-enabled/default

sudo tee /etc/nginx/sites-available/crystal-jewelry-site > /dev/null <<EOF
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;
    root $SITE_DIR;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/crystal-jewelry-site /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx

echo "站点目录：$SITE_DIR"
echo "请把你的静态文件上传进去，然后执行："
echo "sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN"
