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

Or for network analysis `tcpflow`:

```
docker run --rm -it \
  --net=host \
  giantswarm/sys-analysis-tools \
  tcpflow -C -i any port 80
```

Tracing syscall with `strace` also works:

```
docker run --rm -it --privileged --pid=host \
  giantswarm/sys-analysis-tools \
  strace -fp `pidof <pid>`
```
