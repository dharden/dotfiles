#!/bin/bash

DATAFILE="$HOME/.sensordata"
API="https://www.purpleair.com/data.json?show="

commandexists() {
  command -v "$1" >/dev/null 2>&1
}

needData() {
  if [ ! -f "$DATAFILE" ]; then
    return 0
  fi
  MODIFIED=$(stat -c "%Y" "$DATAFILE")
  NOW=$(date +%s)
  DIFFERENCE=$(( $NOW - $MODIFIED ))
  if [ "$DIFFERENCE" -gt 300 ]; then
    return 0
  else
    return 1
  fi
}

getData() {
	curl -sX GET --header "Accept: application/json" "$API$SENSORID" > "$DATAFILE"
}

extractData() {
  if [ -f "$DATAFILE" ]; then
    jq '.data[][1]' "$DATAFILE"
  fi
}

parseData() {
  #who cares if bash supports floats or not
  if [[ "$1" = *.* ]]; then
    PM=$(echo $1 | tr --delete .)
  else
    PM=$(( $1 * 10 ))
  fi
  if (( $PM >= 0 && $PM <= 120 )); then echo "😁"; fi
  if (( $PM > 120 && $PM <= 354 )); then echo "🙂"; fi
  if (( $PM > 355 && $PM <= 554 )); then echo "😕"; fi
  if (( $PM > 555 && $PM <= 1504 )); then echo "☹️"; fi
  if (( $PM > 1505 && $PM <= 2504 )); then echo "😱"; fi
  if (( $PM > 2505 && $PM <= 3504 )); then echo "💀"; fi
  if (( $PM > 3505 )); then echo "🔥"; fi
}

getairquality() {
  if  ! commandexists jq; then echo "please install jq" && exit; fi
  if [ -z "$SENSORID" ]; then echo "please set your sensor id with \"export SENSORID=1234'" && exit; fi
  if needData; then getData; fi
  EXTRACTED_DATA=$(extractData)
  PARSED_DATA=$(parseData "$EXTRACTED_DATA")
  echo $PARSED_DATA
}
