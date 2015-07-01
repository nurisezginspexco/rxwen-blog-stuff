#!/bin/sh

# Author: https://github.com/softwaredownload/openwrt-fanqiang
# Date: 2014-08-22

cp /etc/config/backup/* /etc/config/


uci add network interface
uci rename network.@interface[-1]='wwan'
uci set network.@interface[-1].proto='dhcp'
uci commit network

uci set wireless.@wifi-device[0].disabled=0;
uci set wireless.@wifi-iface[0].ssid='eastking-dir505';
uci set wireless.@wifi-iface[0].encryption='psk2+ccmp';
uci set wireless.@wifi-iface[0].key='wsjdw,8181';
 
uci add wireless wifi-iface
uci set wireless.@wifi-iface[-1].network='wwan'
uci set wireless.@wifi-iface[-1].ssid='现有 WiFi 名字'
uci set wireless.@wifi-iface[-1].device='radio0'
uci set wireless.@wifi-iface[-1].mode='sta'
uci set wireless.@wifi-iface[-1].bssid='现有无线路由器的 MAC 地址'
uci set wireless.@wifi-iface[-1].encryption='psk2+ccmp'
uci set wireless.@wifi-iface[-1].key='现有 WiFi 密码'
uci commit wireless;
wifi

uci get firewall.@zone[1].network
uci show firewall.@zone[1]
uci set firewall.@zone[1].network='wan wan6 wwan'
uci commit firewall
/etc/init.d/firewall restart
