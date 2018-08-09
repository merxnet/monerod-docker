# Dockerized Monero node daemon (monerod)

[![GitHub Release](https://img.shields.io/github/release/merxnet/monerod-docker/all.svg)](https://github.com/merxnet/monerod-docker/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/merxnet/monerod-docker.svg)](https://github.com/merxnet/monerod-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/merxnet/monerod.svg)](https://hub.docker.com/r/merxnet/monerod/)

The goal for this code is to create a modular and easy-to-use Docker image of the Monero (XMR) node daemon `monerod`. To find out more about Monero or keep up on the latest news, visit [their website](https://getmonero.org/). Having a local Monero node allows for quicker and safer transactions without passing information across the Internet and (potentially) leaking information to foreign nodes.

## Quickstart
The Docker image created by this code is conveniently available on [Docker Hub](https://hub.docker.com/r/merxnet/monerod/).
```
docker pull merxnet/monerod
```
To get started, decide where the node data will be securely stored on the host. Pass this directory to the container at runtime:
```
docker run -v /path/to/bitmonero:/root/.bitmonero:rw merxnet/monerod --non-interactive
```
Note that, unless an interactive sessions is desired (by passing `-it` to `docker`), the `--non-interactive` flag **MUST** be passed to the container at runtime. If not, the `monerod` process will automatically exit after a few seconds.

## Usage
This Docker image can be treated just like the binary -- that is, you can provide any and all command line options directly. To view the `monerod` help message, pass the `--help` flag:
```
docker run --rm merxnet/monerod --help
```
Note some of the default settings, specifically the `config-file` location (`/root/.bitmonero/bitmonero.conf`). If running this Docker image as a service, it is often easiest to provide a configuration file via volume along with the `data-dir`. Assuming `bitmonero.conf` is located on the host at `/etc/.bitmonero`, the image could be deployed with this command:
```
docker run --rm -d --name monerod -v /etc/.bitmonero/:/root/.bitmonero/:rw merxnet/monerod --non-interactive
```
Be sure that the container is given read-write access to the `data-dir` volume, as new blocks and transactions must be written to disk.

## Host Configuration
The Docker host (i.e., the machine running `dockerd`) should have ~100GBs of disk space available for the Monero node. At the time of this writing, the node database requires ~60GBs, and it will continue to grow. Consider using a dedicated disk or a partition with enough space for growth (e.g., `/home`).

## Support
Feel free to fork and create pull requests or create issues. Feedback is always welcomed. One can also send donatations to the Monero wallet below.
```
43txUsLN5h3LUKpQFGsFsnRLCpCW7BvT2ZKacsfuqYpUAvt6Po8HseJPwY9ubwXVjySe5SmxVstLfcV8hM8tHg8UTVB14Tk
```
Thank you.
