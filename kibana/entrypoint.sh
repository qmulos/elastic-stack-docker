#! /bin/bash

source ~/.profile
cp /tmp/kibana.dev.yml /usr/share/kibana/config
cd /usr/share/kibana
ls -lah &> /usr/share/kibana/run_logs/kibana_dir.txt
nvm use
#yarn kbn clean
#yarn cache clean
#git config --global --add safe.directory /usr/share/kibana
yarn kbn bootstrap &> run_logs/bootstrap_logs.txt
#node scripts/kbn bootstrap
yarn start --run-examples