# zaproxy 
Zaproxy mail report for cronjob

1- Install Docker

# curl -fsSL https://get.docker.com -o get-docker.sh
# sh get-docker.sh

2- Install Mailutils

# apt install mailutils
or
# yum install mailutils

Chosee smarthost and point it to your mail server.

4- Make the script executable

# chmod +x zaproxy.sh

3- Usage
# sh zaproxy.sh https://yourdomain.com
