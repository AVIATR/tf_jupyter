#!/bin/bash
docker run -d --rm -p 8888:8888 -v "$PWD"/private:/etc/notebook -v "$PWD"/notebooks:/root/notebooks -v /tmp/tflogs:/tmp/tflogs --name tf-jupyter --init aviatr/tf_jupyter
