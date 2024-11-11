#!/bin/bash

# Custom config settings
SUPPORT_CONSTANT=true
SAVE_INTERNAL_TX=true
OPEN_HISTORY_QUERY_WHEN_LITE_FN=true

# Custom script settings
CUSTOM_MAINNET_BIN_PATH=https://raw.githubusercontent.com/joeangel/tron-deployment/master/main_net_config.conf
CUSTOM_TESTNET_BIN_PATH=https://raw.githubusercontent.com/joeangel/tron-deployment/master/test_net_config.conf


# Update MAINNET
CONF_PATH="main_net_config.conf"

if [ -n "$SUPPORT_CONSTANT" ]; then
  from_string="supportConstant = false"
  to_string="supportConstant = $SUPPORT_CONSTANT"
  sed "s#$from_string#$to_string#g" "$CONF_PATH" > tmp
  cat tmp > "$CONF_PATH"
fi

if [ -n "$SAVE_INTERNAL_TX" ]; then
  from_string="saveInternalTx = false"
  to_string="saveInternalTx = $SAVE_INTERNAL_TX"
  sed "s/$from_string/$to_string/g" "$CONF_PATH" > tmp
  cat tmp > "$CONF_PATH"
fi

if [ -n "$OPEN_HISTORY_QUERY_WHEN_LITE_FN" ]; then
  from_string="# openHistoryQueryWhenLiteFN = false"
  to_string="openHistoryQueryWhenLiteFN = $OPEN_HISTORY_QUERY_WHEN_LITE_FN"
  sed "s/$from_string/$to_string/g" "$CONF_PATH" > tmp
  cat tmp > "$CONF_PATH"
fi

rm -f tmp

echo 'Done. Please check deploy_tron.sh for your custom peers.'

# Update deploy_tron.sh
#DEPLOY_TRON_BASH_PATH="deploy_tron.sh"
#
# TODO: pull latest script from official repository
#
#if [ -n "$CUSTOM_MAINNET_BIN_PATH" ]; then
#  from_string="wget https://raw.githubusercontent.com/tronprotocol/TronDeployment/master/main_net_config.conf"
#  to_string="wget $CUSTOM_MAINNET_BIN_PATH"
#  sed "s#$from_string#$to_string#g" "$DEPLOY_TRON_BASH_PATH" > tmp
#  cat tmp > "$DEPLOY_TRON_BASH_PATH"
#fi
#
#if [ -n "$CUSTOM_TESTNET_BIN_PATH" ]; then
#  from_string="wget https://raw.githubusercontent.com/tronprotocol/TronDeployment/master/main_net_config.conf"
#  to_string="wget $CUSTOM_TESTNET_BIN_PATH"
#  sed "s#$from_string#$to_string#g" "$DEPLOY_TRON_BASH_PATH" > tmp
#  cat tmp > "$DEPLOY_TRON_BASH_PATH"
#fi
#
## TODO: add custom peers
#

