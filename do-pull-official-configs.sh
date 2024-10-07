#!/bin/bash

# UPDATE CONFIGS

curl -OL https://raw.githubusercontent.com/tronprotocol/tron-deployment/refs/heads/master/main_net_config.conf
curl -OL https://raw.githubusercontent.com/tronprotocol/tron-deployment/refs/heads/master/private_net_config.conf
curl -OL https://raw.githubusercontent.com/tronprotocol/tron-deployment/refs/heads/master/test_net_config.conf

ls -alht *.conf

echo 'Please check config files, then do git commit and git push.'

