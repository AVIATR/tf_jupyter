############################################################
# Dockerfile to build Python 2.7 + Tensorflow 1.2 image
# Based on Debian
# See https://www.tensorflow.org/install/install_linux for tensorflow installation instructions
############################################################

FROM debian:stable-slim
MAINTAINER Ender Tekin <etekin@wisc.edu>
ENV DEBIAN_FRONTEND noninteractive
ENV TF_BINARY_URL https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.2.1-cp27-none-linux_x86_64.whl
ENV PROTOBUF_URL https://storage.googleapis.com/tensorflow/linux/cpu/protobuf-3.1.0-cp27-none-linux_x86_64.whl
ENV TINI_VERSION v0.15.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

#Install git, python and some other image libraries that opencv needs, install tensorflow, install opencv, cleanup
WORKDIR /tmp
RUN chmod +x /tini && \
    apt-get update && \
    apt-get install -y -q \
        apt-utils build-essential \
        python2.7 python2.7-dev python-pip && \
    apt-get autoremove && \
    apt-get clean && \
    pip install --upgrade pip && \
    pip install jupyter && \
    pip install numpy && \
    pip install matplotlib && \
    pip install --ignore-installed --upgrade ${TF_BINARY_URL} && \
    pip install --ignore-installed --upgrade ${PROTOBUF_URL}

# Set up and launch jupyter notebook
WORKDIR /root
#COPY HelloWorld.ipynb /root/notebooks/
COPY jupyter_notebook_config.py .jupyter/
EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--allow-root"]
