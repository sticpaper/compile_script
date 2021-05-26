#!/bin/bash
## 构建小米4所需的脚本 (不包含源码部分)
## 设备树
git clone --depth=1 https://github.com/sticpaper/android_device_xiaomi_cancro.git -b rebase device/xiaomi/cancro
## 设备树通用项目
git clone --depth=1 https://github.com/sticpaper/android_device_xiaomi_msm8974-common.git -b rebase device/xiaomi/msm8974-common
## 供应商项目仓库
git clone --depth=1 https://github.com/sticpaper/android_vendor_xiaomi_cancro.git -b rebase vendor/xiaomi/cancro
## 供应商通用项目
git clone --depth=1 https://github.com/sticpaper/android_vendor_xiaomi_msm8974-common.git -b rebase vendor/xiaomi/msm8974-common
## 内核仓库
git clone --depth=1 https://github.com/sticpaper/android_kernel_xiaomi_cancro.git -b rebase kernel/xiaomi/cancro
# 初始化系统构建环境
. build/envsetup.sh
# 初始化编译设备
lunch exthm_cancro-userdebug
# 开始编译系统
mka bacon -j8
