#! /bin/bash

activemonitor=$(hyprctl monitors -j | jq '.[] | select(.focused == true).id')

hyprctl dispatch movetoworkspace "$activemonitor$1"
