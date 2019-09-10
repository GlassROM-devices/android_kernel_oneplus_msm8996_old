#!/bin/bash
set -exv;
printf "running gcc tests\n":
git clone https://bitbucket.org/anupritaisno1/aarch64-linux-gnu -b linaro --single-branch --depth=1 -4 aarch64-linux-gnu -j"$(nproc --all)";
export CROSS_COMPILE="/usr/bin/ccache $(pwd)/aarch64-linux-gnu/bin/aarch64-linux-gnu-";
export ARCH=arm64;
export SUBARCH=arm64;
export KBUILD_BUILD_USER="Suzumiya";
export KBUILD_BUILD_HOST="The_literary_club";
export STRIP="$(pwd)/aarch64-linux-gnu/bin/aarch64-linux-gnu-strip";
export CCOMPILE=$CROSS_COMPILE;
export CROSS_COMPILE="/usr/bin/ccache aarch64-linux-gnu-";
export PATH=$PATH:$(pwd)/aarch64-linux-gnu/bin/;
mkdir out;
export O=out;
make O=out ARCH=arm64 lineageos_oneplus3_defconfig;
make O=out ARCH=arm64 headers_install;
make O=out ARCH=arm64 -j"$(nproc --all)";
