FROM ubuntu:trusty

MAINTAINER Ryan Neufeld <ryan@neucode.org>

EXPOSE 8081/tcp

ENV DEBIAN_FRONTEND noninteractive

RUN echo "Installing deadsnakes-python2.7" \
 && apt-add-repository -y ppa:fkrull/deadsnakes-python2.7 \
 && apt-get -q update \
 && apt-get install -yf --force-yes python2.7 python2.7-dev python-pip libcurl4-openssl-dev \
 && pip install --upgrade pip

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

CMD ["/usr/bin/supervisord"]
