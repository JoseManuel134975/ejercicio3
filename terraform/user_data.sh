#!/bin/bash
sudo dnf update -y
sudo dnf install httpd -y
sudo dnf install git -y

sudo systemctl enable httpd

# sudo mkdir -p /var/www/html

sudo git clone https://github.com/JoseManuel134975/ejercicio1.git /tmp/ejercicio1
sudo git clone https://github.com/JoseManuel134975/ejercicio2.git /tmp/ejercicio2
sudo git clone https://github.com/JoseManuel134975/ejercicio4.git /tmp/ejercicio4

# sudo cp -r /tmp/mi_proyecto/src/* /var/www/html

# sudo rm -rf /tmp/mi_proyecto

# sudo chown -R nginx:nginx /var/www/html
# sudo chmod -R 755 /var/www/html
# sudo chown -R nginx:nginx /var/www/otro
# sudo chmod -R 755 /var/www/otro
# sudo cp -r /tmp/mi_proyecto/src/* /var/www/otro

# sudo sed -i 's|root /var/www/html|root /var/www/otro|' /etc/nginx/sites-available/default

# sudo sed -i 's|listen 80|listen 7667|' /etc/nginx/sites-available/default




# sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/otrositio

# sudo sed -i 's|root /var/www/otro|root /var/www/otromas|' /etc/nginx/sites-available/otrositio


# sudo mkdir /var/www/otromas


# sudo mkdir /var/www/otromas/en


# sudo touch /var/www/otromas/en/index.html


# sudo ln -s /etc/nginx/sites-available/otrositio /etc/nginx/sites-enabled/


# sudo rm /etc/nginx/sites-enabled/default




# sudo systemctl start httpd
# sudo systemctl restart httpd 