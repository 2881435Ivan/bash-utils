#!/bin/bash
DATE=$(date +%F)
DEST="/tmp/etc-backup-$DATE.tar.gz"
tar -czf "$DEST" /etc
echo "Backup created at $DEST"

