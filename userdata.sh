#!/bin/bash
# Update the system
apt-get update
apt-get upgrade -y

# Install Apache web server
apt-get install -y apache2

# Start the Apache service
systemctl start apache2
systemctl enable apache2

# Create a simple index page
echo "<h1>Welcome to My Web Server</h1>" > /var/www/html/index.html
