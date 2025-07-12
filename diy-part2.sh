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

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-adguardhome
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/packages/net/smartdns
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/utils/v2dat

#git clone --depth=1 -b main https://github.com/fw876/helloworld.git package/helloworld

#git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome

git clone --depth=1 https://github.com/kenzok8/small-package.git kenzok8-packages
cp -rf kenzok8-packages/ddnsto package/ddnsto
cp -rf kenzok8-packages/luci-app-ddnsto package/luci-app-ddnsto
cp -rf kenzok8-packages/wrtbwmon package/wrtbwmon
cp -rf kenzok8-packages/luci-app-wrtbwmon package/luci-app-wrtbwmon
cp -rf kenzok8-packages/adguardhome package/adguardhome
cp -rf kenzok8-packages/luci-app-adguardhome package/luci-app-adguardhome
cp -rf kenzok8-packages/smartdns package/smartdns
cp -rf kenzok8-packages/luci-app-smartdns package/luci-app-smartdns
#cp -rf kenzok8-packages/mosdns package/mosdns
#cp -rf kenzok8-packages/luci-app-mosdns package/luci-app-mosdns
#cp -rf kenzok8-packages/v2dat package/v2dat
rm -rf kenzok8-packages

git clone --depth=1 -b v5 https://github.com/sbwml/luci-app-mosdns.git mosdns-packages
cp -rf mosdns-packages/mosdns package/mosdns
cp -rf mosdns-packages/luci-app-mosdns package/luci-app-mosdns
cp -rf mosdns-packages/v2dat package/v2dat
rm -rf mosdns-packages

#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

sed -i '/commit firewall/a\	set uhttpd.main.max_requests=50\n	commit uhttpd' feeds/helloworld/luci-app-ssr-plus/root/etc/uci-defaults/luci-ssr-plus

./scripts/feeds update -a
./scripts/feeds install -a
