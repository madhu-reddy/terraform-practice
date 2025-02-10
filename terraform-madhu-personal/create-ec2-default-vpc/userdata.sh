#!/bin/bash

# Update the package index and install Apache web server
sudo apt-get update -y
sudo apt-get install -y apache2

# Start Apache service
sudo service apache2 start

# Enable Apache to start on boot
sudo systemctl enable apache2

# Create a simple "Hello World" HTML page
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Hello World Madhu</title>
</head>
<body>
    <h1>Hello World! by Madhu</h1>
</body>
</html>
EOF
