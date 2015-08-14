#!/bin/sh

set -e

export VENDOR=samsung
export DEVICE=matissewifi
./../../$VENDOR/msm8226-common/extract-files.sh $@
