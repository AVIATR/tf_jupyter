#!/bin/bash
HASHED_PASSWORD=`cat /etc/notebook/pwd.txt`
echo $HASHED_PASSWORD
jupyter notebook --allow-root --NotebookApp.password=${HASHED_PASSWORD}