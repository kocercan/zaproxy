#!/bin/bash

input="/home/ercan/URL_Test.txt" #Create a file and put all URLs in this file line by line with https:// or http://
file="testreport.html"  #This file will generated while scan and deleted after sent via e-mail.
name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1) #Generate random name for container.

while IFS= read -r line
do
timeout --signal=SIGKILL 3600 docker run --rm --name $name -v $(pwd):/zap/wrk/:rw -t  owasp/zap2docker-stable zap-full-scan.py \
   -t $line  -g gen.conf -r testreport.html
docker stop $name || true && docker rm $name || true
if [ -f "$file" ]; then
echo "Scanning is finished successfully" | mail -s "ZAP Scanning Report for $line" toaddr@yourdomain.com -a "From: ZAProxy <zaproxy@yourdomain.com>" -A testreport.html
rm testreport.html
else
echo "Scan Timeout $line"
echo "Scanning cancelled due it doesn't completed in specified time." | mail -s "ZAP Scanning Failed: Timeout $line" toaddr@yourdomain.com -a "From: ZAProxy <zaproxy@yourdomain.com>" 
fi
done < "$input"
~
~
