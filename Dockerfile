FROM progrium/busybox
MAINTAINER Joe Andaverde <joe.andaverde@gmail.com>

RUN opkg-install curl bash git libstdcpp && rm -f /lib/libpthread.so.0 && \
  ln -s /lib/libpthread-2.18.so /lib/libpthread.so.0

ENV NODE_VERSION 0.10.35

RUN mkdir /nodejs && curl http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz | gunzip | tar xvf - -C /tmp && mv /tmp/node-v$NODE_VERSION-linux-x64/* /nodejs/

ENV PATH $PATH:/nodejs/bin

CMD ["/bin/bash"]