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
	fi
elif [ $selector = "all" ]
then
	if [ $what = "name" ]
	then
		nmcli con show | tail -n +2 | head -n 5 | awk '{if ($3 == "wifi") print $1}';
	elif [ $what = "uuid" ]
	then
		nmcli con show | tail -n +2 | head -n 5 | awk '{if ($3 == "wifi") print $2}';
	fi
fi
