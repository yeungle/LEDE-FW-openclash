#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-design/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Modify version number
sed -i "s/^VERSION_NUMBER:=.*/VERSION_NUMBER:=25.12-$(date +%Y%m%d)/" include/version.mk

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-design
rm -rf feeds/luci/applications/luci-app-adguardhome
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/luci/applications/luci-app-openclash

git clone --depth=1 https://github.com/kenzok8/small-package.git kenzok8-packages
cp -rf kenzok8-packages/wrtbwmon package/wrtbwmon
cp -rf kenzok8-packages/luci-app-wrtbwmon package/luci-app-wrtbwmon
cp -rf kenzok8-packages/adguardhome package/adguardhome
cp -rf kenzok8-packages/luci-app-adguardhome package/luci-app-adguardhome
cp -rf kenzok8-packages/luci-app-eqos package/luci-app-eqos
cp -rf kenzok8-packages/luci-app-systools package/luci-app-systools
cp -rf kenzok8-packages/luci-lib-iform package/luci-lib-iform
cp -rf kenzok8-packages/speedtestcli package/speedtestcli
rm -rf kenzok8-packages

git clone --depth=1 https://github.com/vernesong/OpenClash.git OpenClash-packages
cp -rf OpenClash-packages/luci-app-openclash package/luci-app-openclash
rm -rf OpenClash-packages

git clone --depth=1 https://github.com/destan19/OpenAppFilter.git OpenAppFilter
cp -rf OpenAppFilter/luci-app-oaf package/luci-app-oaf
cp -rf OpenAppFilter/oaf package/oaf
cp -rf OpenAppFilter/open-app-filter package/open-app-filter
rm -rf OpenAppFilter

git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 -b js https://github.com/papagaye744/luci-theme-design package/luci-theme-design

git clone --depth=1 https://github.com/linkease/istore istore
cp -rf istore/luci/luci-app-store package/luci-app-store
cp -rf istore/luci/luci-lib-taskd package/luci-lib-taskd
cp -rf istore/luci/luci-lib-xterm package/luci-lib-xterm
cp -rf istore/luci/taskd package/taskd
rm -rf istore

git clone --depth=1 https://github.com/linkease/nas-packages.git nas-packages
cp -rf nas-packages/network/services/quickstart package/quickstart
cp -rf nas-packages/network/services/floatip package/floatip
cp -rf nas-packages/network/services/linkease package/linkease
cp -rf nas-packages/network/services/linkmount package/linkmount
cp -rf nas-packages/network/services/ddnsto package/ddnsto
rm -rf nas-packages

git clone --depth=1 https://github.com/linkease/nas-packages-luci.git nas-packages-luci
cp -rf nas-packages-luci/luci/luci-app-quickstart package/luci-app-quickstart
cp -rf nas-packages-luci/luci/luci-app-floatip package/luci-app-floatip
cp -rf nas-packages-luci/luci/luci-app-linkease package/luci-app-linkease
cp -rf nas-packages-luci/luci/luci-app-ddnsto package/luci-app-ddnsto
rm -rf nas-packages-luci

git clone --depth=1 https://github.com/xiangfeidexiaohuo/extra-ipk.git extra-ipk
cp -rf extra-ipk/op-homebox/homebox package/homebox
cp -rf extra-ipk/op-homebox/luci-app-homebox package/luci-app-homebox
rm -rf extra-ipk

git clone --depth=1 https://github.com/jjm2473/luci-app-autotimeset.git package/luci-app-autotimeset

#./scripts/feeds update -a
#./scripts/feeds install -a
