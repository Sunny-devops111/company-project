#!/bin/bash

echo "================================="
echo "     SERVER HEALTH CHECK"
echo "================================="

echo
echo "1. Nginx Status"
if systemctl is-active --quiet nginx; then
    echo "Nginx: RUNNING"
else
    echo "Nginx: NOT RUNNING"
fi

echo
echo "2. Application Port"
if ss -lnt | grep -q ":8000 "; then
    echo "Application port 8000: OPEN"
else
    echo "Application port 8000: NOT LISTENING"
fi

echo
echo "3. Disk Usage"
df -h /

echo
echo "4. Memory Usage"
free -h

echo
echo "================================="
echo "     HEALTH CHECK COMPLETED"
echo "================================="
