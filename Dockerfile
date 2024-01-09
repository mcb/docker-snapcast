FROM alpine:latest

RUN apk add --no-cache snapcast-server shairport-sync

ADD snapserver.sh /snapserver.sh
RUN chmod 755 /snapserver.sh
RUN mkdir -p /var/run/dbus