#!/bin/bash
METRICS_DIR=/opt/metrics

ping -c 6 -i 10 8.8.8.8 | tail -1| cut -d"=" -f2 | cut -d"/" -f2 >> $METRICS_DIR/node_latencytest_latency.prom
