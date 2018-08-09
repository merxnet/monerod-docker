#!/usr/bin/env bash

NAME=monerod
DATA_DIR=/etc/.bitmonero
LOG_LEVEL=0
RPC_BIND=0.0.0.0

if [[ -f ${DATA_DIR}/bitmonero.conf ]]; then
  docker run -d --rm --name ${NAME} \
    -v ${DATA_DIR}:/root/.bitmonero:rw \
    --net=host merxnet/monerod \
    --non-interactive
else
  docker run -d --rm --name ${NAME} \
    -v ${DATA_DIR}:/root/.bitmonero:rw \
    --net=host merxnet/monerod \
    --non-interactive \
    --log-file /dev/null \
    --log-level ${LOG_LEVEL} \
    --rpc-bind-ip ${RPC_BIND} \
    --confirm-external-bind
fi
