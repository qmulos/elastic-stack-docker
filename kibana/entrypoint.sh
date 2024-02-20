#! /bin/bash

source ~/.profile
cp /tmp/kibana.dev.yml /usr/share/kibana/config
cd /usr/share/kibana
nvm use
yarn kbn clean
yarn cache clean
yarn kbn bootstrap
yarn start --run-examples