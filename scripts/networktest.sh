#!/bin/bash
METRICS_DIR=/opt/metrics
IFS="," read -ra RES <<< "$(speedtest-cli --csv --server 10393)"

echo ${RES[6]} >> $METRICS_DIR/node_speedtest_latency.prom
echo ${RES[7]} >> $METRICS_DIR/node_speedtest_download.prom
echo ${RES[8]} >> $METRICS_DIR/node_speedtest_upload.prom
