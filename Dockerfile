############################################################
# Dockerfile to build Python 3.5 + Tensorflow 1.6 image
# Based on Debian
# See https://www.tensorflow.org/install/install_linux for tensorflow installation instructions
############################################################

FROM debian:stable-slim
MAINTAINER Ender Tekin <etekin@wisc.edu>
ENV DEBIAN_FRONTEND noninteractive
ENV TF_BINARY_URL https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.6.0-cp35-cp35m-linux_x86_64.whl
ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

#Install git, python and some other image libraries that opencv needs, install tensorflow, install opencv, cleanup
WORKDIR /tmp
RUN chmod +x /tini && \
    apt-get update && \
    apt-get install -y -q \
        apt-utils build-essential git vim \
        python3.5 python3.5-dev python3-pip && \
    apt-get autoremove && \
    apt-get clean && \
    pip3 install --upgrade pip && \
    pip3 install jupyter && \
    pip3 install numpy && \
    pip3 install matplotlib && \
	pip3 install jupyter_nbextensions_configurator && \
	pip3 install jupyter_contrib_nbextensions && \
    pip3 install protobuf && \
    pip3 install --ignore-installed --upgrade ${TF_BINARY_URL} && \
	jupyter contrib nbextension install --user && \
	jupyter nbextensions_configurator enable --user

# Set up and launch jupyter notebook
WORKDIR /root
#COPY HelloWorld.ipynb /root/notebooks/
COPY jupyter_notebook_config.py .jupyter/
COPY custom.css .jupyter/custom/
COPY run-jupyter.sh /root
EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["/root/run-jupyter.sh"]
#CMD ["sh", "-c", "/root/run-jupyter.sh"]
