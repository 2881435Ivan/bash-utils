#!/bin/bash
SITE="https://google.com"
LOG="/tmp/site-check.log"
DATE=$(date)
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SITE")

if [ "$STATUS" == "200" ]; then
  echo "$DATE: $SITE is UP" >> "$LOG"
else
  echo "$DATE: $SITE is DOWN (status: $STATUS)" >> "$LOG"
fi

