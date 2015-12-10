FROM debian:sid

RUN apt-get update && apt-get install -y \
      htop \
      tcpdump \
      tcpflow \
      sysstat \
      strace \
      dstat \
      conntrack \
      iotop
