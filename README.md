# System Analyses Tools

Various system analysis tools packaged in a Docker container. This can come in
handy if you need to run tools like `htop` on CoreOS machines and don't want to
switch into `toolbox` every time.

# Usage

You can tools directly. Some of them will need different namespaces in order to
work properly

Let's say `htop` for process analysis:

```
docker run --rm -it \
  --pid=host \
  giantswarm/sys-analysis-tools \
  htop
```

Or for network analysis `tcpflow` or `tcptrace`:

```
docker run --rm -it \
  --net=host \
  giantswarm/sys-analysis-tools \
  tcpflow -C -i any port 80
```

```
docker run --rm -it \
  --net=host \
  giantswarm/sys-analysis-tools \
  tcptrace -l -o1 /tmp/tcpdump.out
```

Tracing syscall with `strace` also works:

```
docker run --rm -it --privileged --pid=host \
  giantswarm/sys-analysis-tools \
  strace -fp `pidof <pid>`
```

If you want to check NAT table (conntrack) counted and ordered by source
address

```
docker run --rm -it --net=host --cap-add=ALL \
  giantswarm/sys-analysis-tools \
  conntrack -L |awk '{print $5}' |sort |uniq -c |sort -k 1
```

If you want to check NAT table (conntrack) counted and ordered by source
address

```
docker run --rm -it --net=host --cap-add=ALL \
  giantswarm/sys-analysis-tools \
  conntrack -L |grep <IP_ADDRESS> |awk '{print $5" "$6" "$8" "$9" "$10"
"$11}' |sort |uniq -c |sort
```

If you want to check top I/O bound processes information

```
docker run --rm -it --net=host --pid=host --cap-add=ALL --privileged \
  giantswarm/sys-analysis-tools \
  iotop
```
