FROM alpine:latest

RUN apk add --no-cache snapcast-server

EXPOSE 1704

ENTRYPOINT ["snapserver"]
