FROM alpine:latest

ARG SHAIRPORT_BRANCH 4.3.2

RUN apk -U add \
        git \
        build-base \
        autoconf \
        automake \
        libtool \
        alsa-lib-dev \
        libdaemon-dev \
        popt-dev \
        libressl-dev \
        avahi-dev \
        libconfig-dev \

 && cd /root \
 && git clone -b "$SHAIRPORT_BRANCH" -c advice.detachedHead=false --single-branch --depth 1 https://github.com/mikebrady/shairport-sync.git \
 && cd shairport-sync \

 && autoreconf -i -f \
 && ./configure \
        --with-pipe \
        --with-stdout \
        --with-avahi \
        --with-ssl=openssl \
        --with-metadata \
 && make \
 && make install \

 && cd / \
 && apk --purge del \
        git \
        build-base \
        autoconf \
        automake \
        libtool \
        alsa-lib-dev \
        libdaemon-dev \
        popt-dev \
        libressl-dev \
        avahi-dev \
        libconfig-dev \
 && apk add \
        dbus \
        alsa-lib \
        libdaemon \
        popt \
        libressl \
        avahi \
        libconfig \
        snapcast-server \
 && rm -rf \
        /etc/ssl \
        /var/cache/apk/* \
        /lib/apk/db/* \
        /root/shairport-sync

ADD snapserver.sh /snapserver.sh
RUN chmod 755 /snapserver.sh \
 && mkdir -p /var/run/dbus