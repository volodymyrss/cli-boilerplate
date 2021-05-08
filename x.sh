#!/bin/bash

function lesta() {
    while true; do ssh lesta01 bash /hpcstorage/savchenk/oda-runner/executor.sh; sleep 600; done
}

function lesta-tail-last() {
    ssh lesta01 'find /hpcstorage/savchenk/oda-runner/logs/$(date +%Y-%m/%d) -type f -cmin -60 -size +10k  | tail -1 | xargs tail -n 10000 -f'
}

function ygg() {
    LOGSTASH_ENTRYPOINT=cdcihn.isdc.unige.ch:5001 oda-node runner start-executor -p :ygg -i 5
}

function bao() {
    LOGSTASH_ENTRYPOINT=cdcihn.isdc.unige.ch:5001 oda-node runner start-executor -p :bao -i 5
}

$@
