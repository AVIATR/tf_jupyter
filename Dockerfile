############################################################
# Dockerfile to build Python 3.5 + Tensorflow latest (currently 1.7) image
# Based on Debian
# See https://www.tensorflow.org/install/install_linux for tensorflow installation instructions
############################################################

FROM debian:stable-slim
MAINTAINER Ender Tekin <etekin@wisc.edu>
ENV DEBIAN_FRONTEND noninteractive
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

#Install git, python and some other image libraries that opencv needs, install tensorflow, install opencv, cleanup
RUN chmod +x /tini && \
    apt-get update && \
    apt-get install -y -q \
        apt-utils build-essential git vim \
        python3.5 python3.5-dev python3-pip && \
    apt-get autoremove && \
    apt-get clean && \
    pip3 install jupyter && \
    pip3 install numpy && \
    pip3 install matplotlib && \
    pip3 install tqdm && \
	pip3 install requests && \
    pip3 install protobuf && \
    pip3 install tensorflow-gpu && \
	pip3 install jupyter_nbextensions_configurator && \
	pip3 install jupyter_contrib_nbextensions && \
	jupyter contrib nbextension install --user && \
	jupyter nbextensions_configurator enable --user

# Set up and launch jupyter notebook
WORKDIR /root
COPY jupyter_notebook_config.py .jupyter/
COPY custom.css .jupyter/custom/
COPY run-jupyter.sh /root
EXPOSE 8888
ENTRYPOINT ["/tini", "-s", "--"]
CMD ["/root/run-jupyter.sh"]
