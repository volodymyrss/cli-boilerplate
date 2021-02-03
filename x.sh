#!/bin/bash

function lesta() {
    while true; do ssh lesta01 bash /hpcstorage/savchenk/oda-runner/executor.sh; sleep 600; done
}

function ygg() {
    LOGSTASH_ENTRYPOINT=cdcihn.isdc.unige.ch:5001 oda-node runner start-executor -p :ygg -i 5
}

function bao() {
    LOGSTASH_ENTRYPOINT=cdcihn.isdc.unige.ch:5001 oda-node runner start-executor -p :bao -i 5
}
