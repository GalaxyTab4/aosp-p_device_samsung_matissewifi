#!/bin/sh

set -e

export DEVICE=matissewifi
export VENDOR=samsung
./../../$VENDOR/msm8226-common/setup-makefiles.sh $@
