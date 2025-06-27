#!/bin/bash
LOGDIR="/var/log/custom"  # или /tmp/test-logs
find "$LOGDIR" -type f -mtime +7 -name "*.log" -exec rm -f {} \;
echo "Old logs deleted from $LOGDIR"
