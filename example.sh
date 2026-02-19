#!/bin/sh

#example for dmenu, mouse multi-menu support.2026.2.19.
menu(){
    local selection
#   selection=$(echo "$choices" | dmenu -m -l 8 -z 100 -d '|' -fn "Monospace-12" -nb "#282c34" -nf "#abb2bf" -sb "#61afef" -sf "#282c34")
    selection=$(echo "$choices" | dmenu -m -l 8 -z 100 -d '|' )
    
    if [ -z "$selection" ]; then
        return
    fi
    
    local cmd=$(echo "$selection" | cut -d'|' -f2-)
    if [ -n "$cmd" ]; then
        eval "$cmd"
    fi
}

menu2(){
    choices="\
suspend|systemctl suspend
reboot|systemctl reboot
shut down|systemctl poweroff
back|main\
"
 menu
}
menu1(){
    choices="\
editor|mousepad 
libre|libreoffice
calc-|menu11
back|main\
"
 menu
}

    menu11(){
        choices="\
bc|st bc
xcalc|xcalc
back|main\
"
menu
}
    

main(){
    choices="\
files|thunar
office-|menu1
system-|menu2 
quit|exit\
"
menu
}
main

