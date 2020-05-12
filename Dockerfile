FROM quay.io/fabstao/centos8:2
MAINTAINER Fabian Salamanca <fsalamanca@ibm.com>

LABEL GOGS Git Repository Image Container based on CentOS 8, could be used for RHEL 8
LABEL Should be used with SQLite 3 only

ARG GDIR=/home/gogs

RUN dnf -y upgrade
RUN dnf -y install git curl wget gzip
RUN useradd -m -d $GDIR gogs
RUN chown -R gogs /home/gogs
USER gogs
WORKDIR $GDIR
RUN cd $GDIR && wget https://dl.gogs.io/0.11.91/gogs_0.11.91_linux_amd64.tar.gz
RUN tar xvfz gogs_0.11.91_linux_amd64.tar.gz
VOLUME $GDIR

ENTRYPOINT ["/home/gogs/gogs/gogs","web"]
