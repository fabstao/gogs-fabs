FROM quay.io/fabstao/centos8:2
#MAINTAINER Fabian Salamanca <fsalamanca@ibm.com>

ENV GDIR /home/gogs
ENV HOME /home/gogs

ARG UNAME=gogs
ARG UID=11000
ARG GID=11000

RUN dnf -y upgrade
RUN dnf -y install git curl wget gzip
RUN mkdir $GDIR 
#RUN groupadd -g $GID $UNAME
RUN echo $UNAME
RUN useradd -u $UID -d $GDIR $UNAME && chown -R $UNAME $GDIR
RUN chmod -R 1777 $GDIR
USER $UNAME
WORKDIR $GDIR
RUN cd $GDIR && wget https://dl.gogs.io/0.11.91/gogs_0.11.91_linux_amd64.tar.gz
RUN tar xvfz gogs_0.11.91_linux_amd64.tar.gz
RUN mkdir $GDIR/.ssh
VOLUME $GDIR

EXPOSE 3000/tcp

ENTRYPOINT ["/home/gogs/gogs/gogs","web"]
