#!/bin/bash
#start bitcoind
#check system date
d=$(date +%s)
echo "$d"
if [ "$d" -lt "1422748800" ]; then 
  echo "system date is incorrect, aborted startup" >> $HOME/cron.log
  exit 0  
fi
$HOME/bitcoind -daemon
exit 0
