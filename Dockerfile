FROM        ubuntu:latest
MAINTAINER  Max Rydahl Andersen "docker@xam.dk"

## bootstrap builds znc and cleans up to
## avoid extra layers
ADD         bootstrap.sh /tmp/
RUN         chmod +x /tmp/bootstrap.sh && sleep 1 && /tmp/bootstrap.sh

RUN         useradd znc
ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default

EXPOSE      6667
EXPOSE      6697

ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]
