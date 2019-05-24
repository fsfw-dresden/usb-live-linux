#!/bin/bash

# This script starts the jupyter server and then opens firefox at the respective URL.
# Normally this should happen automatically but this does not work reliably.

# To reduce the barrier for new users to see an acutal usefull notebook, we deactivate
# the security token. This is OK for a demo on a live system but not recommended on a
# longer lasting system. See commands below and [1] for background information.
# [1] http://blog.jupyter.org/2016/12/21/jupyter-notebook-4-3-1/



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

# demo version without security token (reduces user barrier)
jupyter-notebook --NotebookApp.token=""


# more secure version of the starter command
# (recommended  for productive usage, may require to copy
# and paste some security token string):

# jupyter notebook
