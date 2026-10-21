#!/bin/sh

prayer_times=$(node ./prayertime.js)

fajr=$(echo $prayer_times | jq -r '.fajr' | date -d +%s)
sunrise=$(echo $prayer_times | jq -r '.sunrise' | date -d +%s)
dhuhr=$(echo $prayer_times | jq -r '.dhuhr' | date -d +%s)
asr=$(echo $prayer_times | jq -r '.asr' | date -d +%s)
sunset=$(echo $prayer_times | jq -r '.sunset' | date -d +%s)
maghrib=$(echo $prayer_times | jq -r '.maghrib' | date -d +%s)
isha=$(echo $prayer_times | jq -r '.isha' | date -d +%s)
midnight=$(echo $prayer_times | jq -r '.midnight' | date -d +%s)

times=($dat1 $dat2 $dat3 $dat4 $dat5)

now_sec=$(date +%s)

for v in $times do
  if [ v -gt now_sec]; then
    target=$v
    break
  done
done

next_pray_time=$(date -d @$dat1 +"%I:%M %p")

echo $next_pray_time
