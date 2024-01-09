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
        soxr-dev \
        avahi-dev \
        libconfig-dev \

 && cd /root \
 && git clone https://github.com/mikebrady/shairport-sync.git \
 && cd shairport-sync \
 && git checkout "$SHAIRPORT_BRANCH" \

 && autoreconf -i -f \
 && ./configure \
        --with-alsa \
        --with-pipe \
        --with-avahi \
        --with-ssl=openssl \
        --with-soxr \
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
        soxr-dev \
        avahi-dev \
        libconfig-dev \
 && apk add \
        dbus \
        alsa-lib \
        libdaemon \
        popt \
        libressl \
        soxr \
        avahi \
        libconfig \
        snapcast-server \
 && rm -rf \
        /etc/ssl \
        /var/cache/apk/* \
        /lib/apk/db/* \
        /root/shairport-sync

ADD snapserver.sh /snapserver.sh
RUN chmod 755 /snapserver.sh
RUN mkdir -p /var/run/dbus