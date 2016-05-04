FROM debian:sid

RUN apt-get update && apt-get install -y \
      htop \
      tcpdump \
      tcpflow \
      tcptrace \
      sysstat \
      strace \
      dstat \
      conntrack \
      iotop
