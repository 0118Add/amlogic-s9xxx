#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic' >>feeds.conf.default

# echo '删除重复插件'
rm -rf ./package/luci/applications/luci-app-netdata
rm -rf ./package/luci/applications/luci-app-jd-dailybonus
rm -rf ./package/luci/applications/luci-lib-docker
rm -rf ./package/luci/applications/luci-app-cpufreq
rm -rf ./package/luci/applications/luci-app-dockerman

#git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/lisaac/luci-lib-docker.git package/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone -b revert-271-18.06_bing https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon-18.06
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 替换index.htm文件 n1
wget -O ./package/lean/autocore/files/arm/index.htm https://raw.githubusercontent.com/0118Add/Amlogic-s9xxx/main/diy/n1_lede/index/index_N1.htm

# 替换banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/0118Add/Amlogic-s9xxx/main/diy/n1_lede/banner

