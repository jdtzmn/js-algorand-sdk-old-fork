#!/usr/bin/env bash
set -e

# Navigate back to the project directory
rootdir=`dirname $0`
pushd $rootdir/.. > /dev/null

TEMPLATE_DIR=templates

# Write code generation commands here:
# -> See README.md for the runtime environment and available scripts

$TEMPLATE \
  -s "$ALGOD_SPEC" \
  -t "$TEMPLATE_DIR" \
  -m "src/client/v2/algod/models" \
  -p "$TEMPLATE_DIR/common_config.properties,$TEMPLATE_DIR/parameter_order_overrides.properties" \
