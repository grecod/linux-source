#! /bin/bash -e
# SPDX-License-Identifier: GPL-2.0

BUILDDIR=build
CFGCMD=-c
GENCMJ=-g

if [ "$1" = "$CFGCMD" ]; then
  echo "  Generating .config from defconfig"
  make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 O=$BUILDDIR defconfig
  exit
fi

if [ "$1" = "$GENCMJ" ]; then
  echo "  Generating compile_commands.json"
  python3 scripts/clang-tools/gen_compile_commands.py -d $BUILDDIR -o $BUILDDIR/compile_commands.json
  exit
fi

make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 O=$BUILDDIR $1 $2 $3 $4 $5 $6 $7 $8
