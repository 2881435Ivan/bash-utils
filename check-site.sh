#!/bin/bash

SITE="${1:-https://google.com}"
LOG="/var/log/site-check.log"
DATE=$(date +"%F %T")

# Проверим доступность сайта
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SITE")

# Запишем результат
if [ "$STATUS" == "200" ]; then
  echo "$DATE | $SITE is UP [status: $STATUS]" >> "$LOG"
else
  echo "$DATE | $SITE is DOWN [status: $STATUS]" >> "$LOG"
fi

