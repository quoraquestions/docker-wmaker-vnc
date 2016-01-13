FROM ubuntu:14.04
MAINTAINER jinti shen <jinti.shen@foxmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

#Only for Chinese user
#RUN sed -i 's/archive/cn.archive/g' /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get dist-upgrade -y --force-yes \
    && apt-get install -y --force-yes x11vnc xvfb wmaker wmnd wmdate \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/GNUstep/Defaults
ADD WMState /root/GNUstep/Defaults/
RUN echo 'exec wmaker&' > /root/.xinitrc
RUN chmod +x /root/.xinitrc
EXPOSE 5900
WORKDIR /root
ENTRYPOINT ["x11vnc", "-create", "-forever", "-nopw"]

