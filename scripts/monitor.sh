#!/bin/bash

echo "=== Server Monitor ==="
echo "Date: $(date)"
echo ""

echo "--- CPU & Memory ---"
free -h
echo ""

echo "--- Disk ---"
df -h /
echo ""

echo "--- Top 5 processes by CPU ---"
ps aux --sort=-%cpu | head -6
echo ""

echo "--- Open ports ---"
ss -tulnp | grep LISTEN
echo ""

echo "--- Nginx status ---"
pgrep -a nginx
