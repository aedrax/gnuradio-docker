FROM ubuntu:18.04

LABEL maintainer="paulsorensen5@gmail.com"

ARG USER=gruser

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    xserver-xorg \
    build-essential \
    gir1.2-gtk-3.0 \
    && add-apt-repository ppa:gnuradio/gnuradio-releases && \
    apt-get update && \
    apt-get install -y gnuradio

RUN groupadd -g 1000 -r $USER
RUN useradd -u 1000 -g 1000 --create-home -r $USER

#Change password
RUN echo "$USER:$USER" | chpasswd

#Make sudo passwordless
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-$USER
RUN usermod -aG sudo $USER
RUN usermod -aG plugdev $USER

USER $USER

RUN mkdir -p /home/$USER/src
WORKDIR /home/$USER/src

ENTRYPOINT ["/bin/bash"]
