FROM ubuntu:latest

USER root 

WORKDIR /tempfolder

COPY geoserver-*-bin.zip /tempfolder/

RUN apt-get update -y &&\
    apt -yqq install default-jdk &&\
    apt-get -yqq install unzip &&\
    apt-get -yqq install wget &&\
    mkdir /usr/share/geoserver && \
    unzip -d /usr/share/geoserver/ /tempfolder/geoserver-*-bin.zip &&\
    useradd -m -U -s /bin/false geoserver &&\
    chown -R geoserver:geoserver /usr/share/geoserver

# COPY /service/geoserver.service /usr/lib/systemd/system/geoserver.service

CMD [ "bash","/usr/share/geoserver/bin/startup.sh" ]