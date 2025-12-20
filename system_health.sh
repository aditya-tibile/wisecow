#!/bin/bash
echo "Checking System Health..."

cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
mem=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
disk=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "CPU Usage: $cpu %"
echo "Memory Usage: $mem %"
echo "Disk Usage: $disk %"

if (( $(echo "$cpu > 80" | bc -l) )); then
  echo "ALERT: CPU usage is high"
fi

if (( $(echo "$mem > 80" | bc -l) )); then
  echo "ALERT: Memory usage is high"
fi

if [ $disk -gt 80 ]; then
  echo "ALERT: Disk usage is high"
fi
