#########################################################################
# File Name: feeds.sh
# author: Carbon (ecrasy@gmail.com)
# Description: feel free to use
# Created Time: 2022-07-23 13:04:43 UTC
# Modified Time: 2023-02-17 10:22:27 UTC
#########################################################################

#!/bin/bash

echo "Backup old feeds.conf.default"
mv feeds.conf.default feeds.conf.default.bak

echo "# Custom feeds for OpenWrt" > feeds.conf.default

# passwall
echo "Adding xiaorouji passwall"
echo "src-git PWpackages https://github.com/ecrasy/openwrt-passwall.git;packages" >> feeds.conf.default
echo "src-git PWluci https://github.com/ecrasy/openwrt-passwall.git;luci" >> feeds.conf.default

# passwall2
echo "Adding xiaorouji Passwall2"
echo "src-git Passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

# add custom packages
echo "Adding custom packages"
echo "src-git CustomPkgs https://github.com/ecrasy/custom-packages.git;for_official" >> feeds.conf.default

# ssrp
echo "Adding ShadowSocksR Plus"
echo "src-git ssrp https://github.com/ecrasy/ssrp.git;main" >> feeds.conf.default

echo "Restore feeds.conf.default"
echo -e "\n# Default feeds for OpenWrt" >> feeds.conf.default
cat feeds.conf.default.bak >> feeds.conf.default
rm -rf feeds.conf.default.bak

echo "Remove git full clone"
sed -i "s/src-git-full/src-git/g" feeds.conf.default

echo "Adding Feeds Completed!!!"

