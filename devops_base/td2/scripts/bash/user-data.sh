#!/usr/bin/env bash
set -e

# Mettre à jour le système et installer Node.js
yum update -y
curl -sL https://rpm.nodesource.com/setup_21.x | bash -
yum install -y nodejs

# Créer app.js dans /home/ec2-user
cat << 'EOF' > /home/ec2-user/app.js
const http = require('http');
const port = 80;  // port fixe
const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello, World!\n');
});
server.listen(port, '0.0.0.0', () => {
  console.log(`Listening on port ${port}`);
});
EOF

# Lancer l'app en arrière-plan avec sudo et logs
sudo nohup node /home/ec2-user/app.js > /home/ec2-user/app.log 2>&1 &
