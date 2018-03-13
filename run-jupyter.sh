#!/bin/bash
HASHED_PASSWORD=`cat /etc/notebook/pwd.txt`
jupyter notebook --allow-root --NotebookApp.password="$HASHED_PASSWORD"