#!/bin/bash/

input="/home/user/URL_List.txt"
while IFS= read -r line
do

docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py \
    -t $line  -g gen.conf -r testreport.html

echo "ZAP Scaning Report Ektedir" | mail -s "ZAP Scanning Report $line" toaddr@yourdomain.com -a "From: ZAProxy <zaproxy@yourdomain.com>" -A testreport.html 
rm testreport.html
done < "$input"
