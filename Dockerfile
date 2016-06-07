FROM ubuntu:trusty

MAINTAINER Ryan Neufeld <ryan@neucode.org>

EXPOSE 8081/tcp

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
 && apt-get -yf install software-properties-common \
 && apt-add-repository multiverse \
 && apt-get -qq update \
 && apt-get -yf install supervisor python python-pip unzip libssl-dev git python-dev unrar libffi-dev

ADD conf/supervisord.conf /etc/supervisor/conf.d/sickrage.conf
RUN git clone https://github.com/SickRage/SickRage.git /sickrage
RUN mkdir -p /sickrage/Logs/supervisor

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/sickrage.conf"]
