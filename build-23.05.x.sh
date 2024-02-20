#!/bin/bash

# 打印 info
make info

# 指定要构建的目标映像
PROFILE="generic"

# 要嵌入映像的软件包列表
PACKAGES=""
# 基础包
## 基础组件
PACKAGES="$PACKAGES coremark kmod-tcp-bbr lm-sensors-detect nano"
## 虚拟网卡驱动
#PACKAGES="$PACKAGES kmod-e1000 kmod-e1000e kmod-vmxnet3" # 虚拟网卡驱动，默认已包含，无需额外添加
## 主题
PACKAGES="$PACKAGES luci-theme-argon luci-i18n-argon-config-zh-cn"
## 界面翻译补全
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn"

# 系统
## 定时重启
PACKAGES="$PACKAGES luci-i18n-autoreboot-zh-cn"
# Diskman 磁盘管理
PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"
# CPU 占用限制
PACKAGES="$PACKAGES luci-i18n-cpulimit-zh-cn"
# collectd 统计
PACKAGES="$PACKAGES luci-i18n-statistics-zh-cn"
# 文件助手
PACKAGES="$PACKAGES luci-app-fileassistant"
# 硬盘休眠
PACKAGES="$PACKAGES luci-i18n-hd-idle-zh-cn"
# zsh 终端
PACKAGES="$PACKAGES zsh"
# Vim 完整版，带语法高亮
PACKAGES="$PACKAGES vim-fuller"
# X/Y/ZMODEM 文件传输
PACKAGES="$PACKAGES lrzsz"
# OpenSSH
PACKAGES="$PACKAGES openssh-server openssh-client"
# Netdata 系统监控界面
PACKAGES="$PACKAGES netdata"

# 服务
## upnp
PACKAGES="$PACKAGES luci-i18n-upnp-zh-cn"
# GoWebDav
PACKAGES="$PACKAGES luci-i18n-gowebdav-zh-cn"
# Samba 网络共享
PACKAGES="$PACKAGES luci-i18n-samba4-zh-cn"
# qBittorrent 下载器
PACKAGES="$PACKAGES luci-i18n-qbittorrent-zh-cn"
# Aria2 下载器
PACKAGES="$PACKAGES luci-i18n-aria2-zh-cn"
# FTP 服务器
PACKAGES="$PACKAGES luci-i18n-vsftpd-zh-cn"
# Adbyby-plus
PACKAGES="$PACKAGES luci-app-adbyby-plus-zh-cn"
# Mosdns
PACKAGES="$PACKAGES luci-app-mosdns-zh-cn"
# minidlna
PACKAGES="$PACKAGES luci-app-minidlna-zh-cn"
# rclone
PACKAGES="$PACKAGES luci-app-rclone-zh-cn"
# alist
PACKAGES="$PACKAGES luci-app-alist"

# Docker 组件
PACKAGES="$PACKAGES luci-i18n-dockerman-zh-cn luci-i18n-docker-zh-cn"

# 网络
## passwall
PACKAGES="$PACKAGES luci-i18n-passwall-zh-cn" # 依赖 ipt2socks
# OpenClash 代理
PACKAGES="$PACKAGES luci-app-openclash"
# turboacc
PACKAGES="$PACKAGES luci-i18n-turboacc-zh-cn" # 补齐 turboacc 中文翻译。官方源未提供 turboacc。
# firewall
PACKAGES="$PACKAGES  -iptables -firewall nftables firewall4"  # firewall4 存在兼容问题，暂时换回老版本
# IPSec VPN
PACKAGES="$PACKAGES luci-i18n-ipsec-vpnd-zh-cn"
# EQoS 网速控制
PACKAGES="$PACKAGES luci-i18n-eqos-zh-cn"
# 多线多拨与负载均衡
PACKAGES="$PACKAGES luci-app-syncdial luci-i18n-mwan3-zh-cn"
# 宽带监控 Nlbwmon
PACKAGES="$PACKAGES luci-i18n-nlbwmon-zh-cn"

# 移除不需要的包
## 磁盘驱动和挂载
PACKAGES="$PACKAGES -kmod-fs-f2fs -mkf2fs -automount -block-mount"
## 音频驱动
PACKAGES="$PACKAGES -alsa-utils -kmod-ac97 -kmod-sound-hda-codec-hdmi -kmod-sound-hda-codec-realtek -kmod-sound-hda-codec-via -kmod-sound-hda-core -kmod-sound-hda-intel -kmod-sound-i8x0 -kmod-sound-via82xx"
## 网卡驱动
PACKAGES="$PACKAGES -kmod-8139cp -kmod-8139too -kmod-amazon-ena -kmod-amd-xgbe -kmod-bnx2 -kmod-forcedeth -kmod-i40e -kmod-igb -kmod-igbvf -kmod-igc -kmod-ixgbe -kmod-ixgbevf -kmod-pcnet32 -kmod-r8101 -kmod-r8125 -kmod-r8168 -kmod-tg3 -kmod-tulip"
## USB驱动
PACKAGES="$PACKAGES -kmod-usb-audio -kmod-usb-hid -kmod-usb-net -kmod-usb-net-asix -kmod-usb-net-asix-ax88179 -kmod-usb-net-rtl8150 -kmod-usb-net-rtl8152-vendor"
## pppoe 拨号
# PACKAGES="$PACKAGES -ppp -ppp-mod-pppoe"
## IPv6，CONFIG_IPV6=n
# PACKAGES="$PACKAGES -ipv6helper"
## filetransfer
# PACKAGES="$PACKAGES -luci-app-filetransfer"

# 包含自定义文件的目录
FILES="files"

# 要禁用的 /etc/init.d 中服务的名称
DISABLED_SERVICES="sshd"

make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"
