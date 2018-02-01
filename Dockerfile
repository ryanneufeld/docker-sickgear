FROM ubuntu:trusty

MAINTAINER Ryan Neufeld <ryan@neucode.org>

EXPOSE 8081/tcp

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
 && apt-get -yf install software-properties-common \
 && apt-add-repository multiverse \
 && apt-get -qq update \
 && apt-get -yf install supervisor python python-pip unzip libssl-dev git python-dev unrar libffi-dev python-cheetah unrar-free git

ADD conf/supervisord.conf /etc/supervisor/conf.d/sickgear.conf
# RUN python -m pip install cheeta lxml regex scandir
RUN git clone https://github.com/SickGear/SickGear.git /sickgear
RUN mkdir -p /sickgear/Logs/supervisor
RUN mkdir -p /data

VOLUME /data

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/sickgear.conf"]
