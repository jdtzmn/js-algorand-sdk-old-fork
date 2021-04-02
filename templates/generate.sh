#!/usr/bin/env bash
set -e

rootdir=`dirname $0`
pushd $rootdir/.. > /dev/null

function my_exit {
  popd > /dev/null
  exit $1
}

TEMPLATE_DIR=templates

while [ "$1" != "" ]; do
    case "$1" in
        -a|--algod-spec)
            shift
            ALGOD_SPEC=$1
            ;;
        *)
            echo "Unknown option $1"
            help
            my_exit 0
            ;;
    esac
    shift
done

$TEMPLATE \
  -s "$ALGOD_SPEC" \
  -t "$TEMPLATE_DIR" \
  -m "src/client/v2/algod/models" \
  -p "$TEMPLATE_DIR/common_config.properties,$TEMPLATE_DIR/parameter_order_overrides.properties" \
