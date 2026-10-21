#!/bin/bash

function get_times() {
  local pray_times=$(node ./prayertime.js)

  echo "$pray_times" | yq -r '
    "fajr: "     + .fajr,
    "sunrise: "  + .sunrise,
    "dhuhr: "    + .dhuhr,
    "asr: "      + .asr,
    "sunset: "   + .sunset,
    "maghrib: "  + .maghrib,
    "isha: "     + .isha,
    "midnight: " + .midnight
  '
}

function get_next_pray() {
  local -n pray_times=$1
  local now_sec=$2

  for pray in "${pray_times[@]}"; do
    local time=$(echo "$pray" | awk '{print $2 " " $3}')
    if [ $(date -d "$time" +%s) -gt $now_sec ]; then
      local next_pray=$pray
      break
    fi
  done

  echo "$next_pray"
}

function get_previous_pray() {
  local -n pray_times=$1
  local now_sec=$2

  for pray in "${pray_times[@]}"; do
    local time=$(echo "$pray" | awk '{print $2 " " $3}')
    if [ $(date -d "$time" +%s) -lt $now_sec ]; then
      local previous_pray=$pray
    else
      break
    fi
  done

  echo "$previous_pray"
}

function json_return() {
  local next_pray_name=$1
  local time_remaining=$2
  local tooltip="Salatuk"

  jq -n --compact-output \
    --arg text ""${next_pray_name}" -"${time_remaining}"" \
    --arg tooltip "$tooltip" \
    '{text:$text, tooltip:$tooltip}'
}

function main() {
  local now_sec=$(date +%s)
  mapfile -t times < <(get_times)

  local next_pray=$(get_next_pray times $now_sec)
  local next_pray_name=$(echo "$next_pray" | awk '{print $1}')
  local next_pray_time=$(echo "$next_pray" | awk '{print $2 " " $3}')

  local diff=$(($(date -d "$next_pray_time" +%s) - $now_sec))
  local time_remaining=$(printf '%02d:%02d:%02d\n' $((diff / 3600)) $(((diff % 3600) / 60)) $((diff % 60)))

  if [ "$diff" -eq 600 ]; then
    notify-send -t 5000 "Salatuk" "the next pray is $next_pray_name after $time_remaining"
  fi

  json_return "$next_pray_name" "$time_remaining"
}

main
