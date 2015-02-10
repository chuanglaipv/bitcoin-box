#!/bin/bash
/home/linaro/hdd/bitcoin-cli -datadir=/home/linaro/hdd/.bitcoin stop
echo "Do not shut down the device until notified"
x=$(pgrep -f bitcoind)
while [ "$x" !=  "" ]
do
  echo -n "."
  sleep 1s
  x=$(pgrep -f bitcoind)
done
echo "bitcoin has stopped.  OK to shutdown"