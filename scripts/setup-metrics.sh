#!/bin/bash
source "/vagrant/scripts/common.sh"

echo "setup metrics"
cp -r /vagrant/metrics /usr/local
mkdir -p /vagrant/metrics/data