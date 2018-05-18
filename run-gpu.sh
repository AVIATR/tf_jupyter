#!/bin/bash
docker run -d --rm -p 8888:8888 -p 6006:6006 \
    -v $(pwd)/private:/etc/notebook \
    -v $(pwd)/notebooks:/tmp/notebooks \
    -v /tmp/tflogs:/tmp/tflogs \
    -w /tmp \
    --runtime=nvidia \
    --name tf-jupyter --init aviatr/tf_jupyter:gpu
