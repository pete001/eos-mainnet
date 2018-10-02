#!/bin/bash

cd /opt/mainnet
rm -rf blocks state
wget $(wget --quiet "https://eosnode.tools/api/blocks?limit=1" -O- | jq -r '.data[0].s3') -O blocks_backup.tar.gz
tar xvzf blocks_backup.tar.gz