#!/bin/bash
# 请将脚本放置到内核源码根目录下
# 并在“.gitignore”文件中 添加 "clang_kernel_build.sh" 避免产生后缀dirty
# 设置内核构建体系
export ARCH=arm64
export SUBARCH=arm64

# 自定义选项 USER为构建用户 HOST为构建主机
export KBUILD_BUILD_USER="android"
export KBUILD_BUILD_HOST="localhost"

# 生成config device_defconfig更改为你使用的机型的defconfig即可
make O=out ARCH=arm64 SUBARCH=arm64 CC=${PWD}/toolchain/clang/bin/clang device_defconfig

# 开始构建内核
make -j24 O=out ARCH=arm64 SUBARCH=arm64 \
CC=${PWD}/toolchain/clang/bin/clang \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=${PWD}/toolchain/gcc/bin/aarch64-linux-gnu- \
CROSS_COMPILE_ARM32=${PWD}/toolchain/gcc/bin/arm-linux-gnueabi-
