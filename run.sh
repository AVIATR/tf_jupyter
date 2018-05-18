#!/bin/bash
BRANCH=`git rev-parse --abbrev-ref HEAD`
if [ $BRANCH = "master" ]; then
    BRANCH=latest
fi
docker run -d --rm -p 8888:8888 -p 6006:6006 \
    -v $(pwd)/private:/etc/notebook \
    -v $(pwd)/notebooks:/tmp/notebooks \
    -v /tmp/tflogs:/tmp/tflogs \
    -w /tmp \
    --name tf-jupyter --init aviatr/tf_jupyter:$BRANCH
