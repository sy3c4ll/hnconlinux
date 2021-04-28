FROM debian:buster
COPY hh.deb /hh.deb
COPY hv.deb /hv.deb
RUN echo "Installing dependencies..."&&apt-get update -y&&apt-get upgrade -y&&apt-get install -y curl qt5-default libcurl4-gnutls-dev libharfbuzz-icu0
RUN echo "Installing HWPOffice and HWPViewer..."&&apt-get install -y /hh.deb /hv.deb&&rm /hh.deb /hv.deb
RUN echo "Installing nimf..."&&curl -sL https://apt.hamonikr.org/setup_hamonikr.sun|bash - &&apt-get install -y nimf nimf-libhangul&&im-config -n nimf&&apt-get clean
RUN echo "Configuring users..."&&useradd -mg users -s /bin/bash hnc
RUN echo "Generating locale..."&&apt-get install -y locales&&echo "ko_KR.UTF-8 UTF-8">/etc/locale.gen&&locale-gen
ENV LC_ALL ko_KR.UTF-8
ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8
USER hnc

