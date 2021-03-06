############################################################
# Dockerfile to build Python 3.5 + Tensorflow latest (currently 1.8) image
# Based on Debian
# See https://www.tensorflow.org/install/install_linux for tensorflow installation instructions
############################################################

FROM debian:stable-slim
MAINTAINER Ender Tekin <etekin@wisc.edu>
ENV DEBIAN_FRONTEND noninteractive

#Install git, python and some other image libraries that opencv needs, install tensorflow, install opencv, cleanup
RUN apt-get update && \
    apt-get install -y -q \
        apt-utils build-essential git vim libmagickwand-dev \
        python3.5 python3.5-dev python3-pip && \
    apt-get autoremove && \
    apt-get clean && \
    /usr/bin/env python3 -m pip install jupyter && \
    /usr/bin/env python3 -m pip install numpy && \
    /usr/bin/env python3 -m pip install matplotlib && \
    /usr/bin/env python3 -m pip install tqdm && \
    /usr/bin/env python3 -m pip install requests && \
    /usr/bin/env python3 -m pip install protobuf && \
    /usr/bin/env python3 -m pip install Wand && \
    /usr/bin/env python3 -m pip install tensorflow && \
    /usr/bin/env python3 -m pip install jupyter_nbextensions_configurator && \
    /usr/bin/env python3 -m pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user && \
    jupyter nbextensions_configurator enable --user

# Set up and launch jupyter notebook
WORKDIR /root
COPY jupyter_notebook_config.py .jupyter/
COPY custom.css .jupyter/custom/
COPY run-jupyter.sh /root
# Expose the ports for jupyter notebook and tensorboard
EXPOSE 8888 6006
CMD ["/root/run-jupyter.sh"]
