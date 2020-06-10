#!/bin/bash/
docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py \
    -t $1  -g gen.conf -r testreport.html

echo "ZAP Scaning Report Ektedir" | mail -s "ZAP Scanning Report $1" toaddr@yourdomain.com -r fromaddr@yourdomain.com -A testreport.html 
rm testreport.html
