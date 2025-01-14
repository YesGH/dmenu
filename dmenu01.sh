#!/bin/sh

#dmenu二级菜单，主菜单在最后,子菜单用-d参数分隔符' ',dmenu打了鼠标支持补丁，分割separator补丁，窗口xyw补丁(20240427 yegang)
#单双引号问题，-d选项时原来的双引号需改成单引号

menu0(){
echo "$choices" | dmenu "$@" -l 8 -d ' ' -x 300 -z 100|${SHELL:-"/bin/sh"} &
}


## 办公 ##
menu01(){
choices="\
文本 mousepad 
金山 wps
自由 libreoffice
Abiword abiword
gnumeric gnumeric
homebank homebank
中金财富 中金E财富-x86_64.AppImage
Webull /usr/local/WebullDesktop/WebullDesktop
Zathura zathura
字符表 gucharmap
计算器 st -T 'bc' -e sh -c 'bc -lq'
计算器U xcalc
back ~/dmenu0.sh
"
menu0
}

## 网络 ##
menu02(){
choices="\
chromium chromium
vivaldi vivaldi
firefox firefox
surf ~/surf-open.sh "https://mail.10086.cn"
腾讯会议 /opt/wemeet/wemeetapp.sh
thunderbird thunderbird
sylpheed sylpheed
网络蓝牙 ~/nmgui
rustdesk rustdesk
deluge deluge
rdesktop rdesktop
back ~/dmenu0.sh
"
menu0
}


## 媒体 ##
menu03(){
choices="\
视频播放 vlc
音频播放 audacious 
网络电台 streamtuner2  
quodlibet quodlibet
音量控制 pavucontrol
音视录屏 simplescreenrecorder
musescore musescore3
wmuk audacious '-H' 'http://ice2.wmuk.org:8123/hls3'
wmuk2 audacious '-H' 'http://ice2.wmuk.org:8123/mp32'
LNR audacious '-H' 'http://lin1.san.fast-serv.com:6048/stream.mp3'
radiooff killall "audacious"
back ~/dmenu0.sh
"
menu0
}


## 图形 ##
menu04(){
choices="\
录屏 peek
看图 ristretto
修图 gimp
openscad openscad
back ~/dmenu0.sh
"
menu0
}


##通信##
menu05(){
choices="\
网络蓝牙 ~/nmgui
网络管理 st -T 'wifi connect' -e 'nmtui'
虫洞接收 st -T 'wormhole receive' -e sh -c 'wormhole receive'
cadaver st -T 'cadaver' -e sh -c 'cadaver'
rustdesk rustdesk
deluge deluge
rdesktop rdesktop
back ~/dmenu0.sh
"
menu0
}

## 设置 ##
menu06(){
choices="\
tmux st tmux
deskapp ls /usr/share/applications/ | dmenu -z 280 -l 8| xargs -I {} gtk-launch {}
虚拟机 virtualbox
任务管理 xfce4-taskmanager
back ~/dmenu0.sh
"
menu0
}

## 系统 ##
menu07(){
choices="\
时钟开启 /usr/local/bin/slstatus
时钟关闭 killall slstatus
加载C st -T 'load C' -e sh -c 'sudo mount /dev/sda3 /media/g/'
加载D st -T 'load D' -e sh -c 'sudo mount /dev/sda5 /media/g/'
卸载A st -T 'unload' -e sh -c 'sudo umount /media/g/'
1920x1080 xrandr -s 1920x1080
1368x768 xrandr -s 1368x768
1280x720 xrandr -s 1280x720
主屏关闭 xrandr --output eDP-1 --off
触板关 xinput disable 12
触板开 xinput enable 12
挂起 systemctl "suspend"
重启 systemctl "reboot"
关机 systemctl "poweroff"
bakc ~/dmenu0.sh
"
menu0
}

#main主菜单#
#main(){
#choices="\
#文件\n办公\n网络\n媒体\n图形\n通信\n配置\n系统
#"
#chosen=$(echo "$choices"| dmenu -l 8 -x 300 -z 100)
#case "$chosen" in
#文件)pcmanfm;;
#办公)menu01;;
#网络)menu02;;
#媒体)menu03;;
#图形)menu04;;
#通信)menu05;;
#配置)menu06;;
#系统)menu07
#esac
#}
#main
#
main(){
choices="\
文件 pcmanfm
办公 menu01
网络 menu02
媒体 menu03
图形 menu04
通信 menu05
配置 menu06
系统 menu07
"
menu0
}
main
