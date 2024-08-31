#!/bin/bash

max_attempts=10
sleep_duration=1
verbose=false

while getopts "vm:" opt; do
  case $opt in
    v) verbose=true ;;
    m) max_attempts=$OPTARG ;;
    *) echo "Usage: $0 [-v] [-m max_attempts]"; exit 1 ;;
  esac
done

warp-cli --accept-tos connect

attempt_count=0

while (( attempt_count < max_attempts )); do
  if warp-cli --accept-tos status | grep -iq connected; then
    echo "Connected successfully."
    break
  else
    ((attempt_count++))
    $verbose && echo "Reconnect attempt $attempt_count/$max_attempts..."
  fi
  sleep $sleep_duration
done

if (( attempt_count == max_attempts )); then
  echo "Failed to connect after $max_attempts attempts."
  exit 1
fi
