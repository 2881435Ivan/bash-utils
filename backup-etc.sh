#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi


DATE=$(date +%F)
DEST="/tmp/etc-backup-$DATE.tar.gz"
LOGFILE="/var/log/etc-backup.log"

echo "$(date): --- Starting backup ---" | tee -a "$LOGFILE"

# Удаление старых архивов
echo "$(date): Cleaning old backups..." | tee -a "$LOGFILE"
find /tmp -name "etc-backup-*.tar.gz" -mtime +7 -exec rm -f {} \; >> "$LOGFILE" 2>&1

# Удалим файл, если уже существует
[ -f "$DEST" ] && rm -f "$DEST"

# Создание нового архива
if tar -czf "$DEST" /etc; then
  echo "$(date): ✅ Backup created at $DEST" | tee -a "$LOGFILE"
else
  echo "$(date): ❌ Backup failed!" | tee -a "$LOGFILE" >&2
  exit 1
fi

