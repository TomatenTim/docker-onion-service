FROM alpine

RUN apk update && apk add tor

RUN mkdir /keys && chown -R 1000:1000 /keys
RUN mkdir /config && chown -R 1000:1000 /config

RUN mkdir /home/tor && chown -R 1000:1000 /home/tor
ENV HOME=/home/tor

USER 1000:1000

VOLUME [ "/keys" ]
VOLUME [ "/config" ]
CMD ["tor", "-f", "/config/torrc"]