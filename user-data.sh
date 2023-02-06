#!/bin/bash
apt update -y

apt install apache2 -y
systemctl start apache2


cd /var/www/html

touch index.html

cat > index.html << EOF

<!DOCTYPE html>
<html>
  <head>
    <title>New Page</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
  </body>
</html>



