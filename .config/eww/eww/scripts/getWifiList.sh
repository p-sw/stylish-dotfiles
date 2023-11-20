#!/bin/bash

selector=$1;
what=$2;

if [ $selector = "current" ] 
then
	if [ $what = "name" ]
	then
		nmcli con show | tail -n +2 | head -n 5 | awk '{if ($3 == "wifi" && $4 == "wlan0") print $1}';
	elif [ $what = "uuid" ]
	then
		nmcli con show | tail -n +2 | head -n 5 | awk '{if ($3 == "wifi" && $4 == "wlan0") print $2}';
	elif [ $what = "constat" ]
	then
		nmcli -fields WIFI g | sed 1d
	fi
elif [ $selector = "all" ]
then
	if [ $what = "name" ]
	then
		nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/(WPA. )+/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d"
	elif [ $what = "uuid" ]
	then
		nmcli con show | tail -n +2 | head -n 5 | awk '{if ($3 == "wifi") print $2}';
	fi
elif [ $selector = "con" ]
then
	if [ $what = "up" ]
	then
		saved_connections=$(nmcli -g NAME connection)
		chosen_network=$3
		chosen_id=$(echo $3 | sed 's/ //g' | sed 's/ //g')

		success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."		
		if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
			nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
			eww update selectedwifi=""
		else
			if [[ "$chosen_network" =~ "" ]]; then
				eww open wifipassdiag
			fi
			# nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
		fi
	elif [ $what = "upp" ]
	then
		chosen_id=$(echo $3 | sed 's/ //g' | sed 's/ //g')
		password=$4

		success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."

		nmcli device wifi connect "$chosen_id" password "$password" | grep "successfully" && notify-send "Connection Established" "$success_message"

		eww update selectedwifi=""
	elif [ $what = "down" ]
	then
		chosen_id=$(echo $3 | sed 's/ //g' | sed 's/ //g')
		nmcli connection down id "$chosen_id" | grep "successfully" && notify-send "Disconnected" "Successfully disconnected from $chosen_id."
		eww update selectedwifi=""
	fi
fi
