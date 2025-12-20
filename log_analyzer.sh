#!/bin/bash
logfile=/var/log/apache2/access.log

echo "Log File Analysis"

echo "Total 404 Errors:"
grep " 404 " $logfile | wc -l

echo "Most Requested Page:"
awk '{print $7}' $logfile | sort | uniq -c | sort -nr | head -1

echo "IP with Most Requests:"
awk '{print $1}' $logfile | sort | uniq -c | sort -nr | head -1
