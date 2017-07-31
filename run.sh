#!/bin/bash
docker run -d -p 8888:8888 -v ${PWD}/private:/etc/ssl/notebook --name vanilla_tf endertekin/vanilla_tf
