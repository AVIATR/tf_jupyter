#!/bin/bash
#Start docker with ssh
HASHED_PASSWORD=`cat "$PWD"/private/pwd.txt`
docker run -d --rm -p 8888:8888 -v "$PWD"/private/cert:/etc/ssl/notebook -v "$PWD"/notebooks:/root/notebooks --name tf-jupyter aviatr/tf_jupyter jupyter notebook --allow-root --NotebookApp.password=${HASHED_PASSWORD}