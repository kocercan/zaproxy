# zaproxy 
Zaproxy mail report for cronjob

1- Install Docker

# curl -sSL https://get.docker.com | sh

2- Install Mailutils

# apt install mailutils
or
# yum install mailx

Chosee smarthost and point it to your mail server.

4- Make the script executable

# chmod +x zaproxy.sh

3- Usage
# sh zaproxy.sh https://yourdomain.com
