ARG ALPINE_VERSION=3.8

FROM frolvlad/alpine-glibc:alpine-${ALPINE_VERSION}

ENV MONERO_VERSION=v0.13.0.4

RUN apk update \
    && apk add --no-cache tar wget \
    && wget https://github.com/monero-project/monero/releases/download/${MONERO_VERSION}/monero-linux-x64-${MONERO_VERSION}.tar.bz2 \
    && tar -xvjf monero-linux-x64-${MONERO_VERSION}.tar.bz2 \
    && cp monero-${MONERO_VERSION}/monerod /usr/local/bin/ \
    && rm -rf monero-linux-x64-${MONERO_VERSION}.tar.bz2 monero-${MONERO_VERSION}/ \
    && apk del tar wget

EXPOSE 18080 18081 18082

ENTRYPOINT ["monerod"]
