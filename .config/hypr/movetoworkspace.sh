#! /bin/bash

activemonitor=$(hyprctl monitors -j | jq '.[] | select(.focused == true).id')

DEST=$(($activemonitor + 1))$1
if [[ $1 -eq "0" ]]
then
  DEST=$(($activemonitor + 2))$1
fi
hyprctl dispatch movetoworkspace $DEST
