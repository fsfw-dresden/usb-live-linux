#!/bin/bash

# This script starts the jupyter server and then opens firefox at the respective URL.
# Normally this should happen automatically but this does not work reliably.



function start_firefox() {
echo "Waiting for jupyter server to start"

# Test whether the respective port is open
until nc -z 127.0.0.1 8888;
do
  sleep 1
done

sleep 1
firefox http://localhost:8888/

}

start_firefox &

jupyter notebook 
