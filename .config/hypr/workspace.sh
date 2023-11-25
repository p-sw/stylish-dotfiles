#! /bin/bash

activemonitor=$(hyprctl monitors -j | jq '.[] | select(.focused == true).id')
#passivemonitor=$(hyprctl monitors -j | jq '.[] | select(.focused == false).id')
#activews=$(hyprctl monitors -j | jq '.[] | select(.focused == true).activeWorkspace.id')
#passivews=$(hyprctl monitors -j | jq '.[] | select(.focused == false).activeWorkspace.id')

# Comment out all lines below except the last to switch back to the default Hyprland dispatch method
#[[ $1 -eq $passivews ]] && [[ $passivemonitor != "$activemonitor" ]] && (hyprctl dispatch swapactiveworkspaces "$activemonitor $passivemonitor")
#notify-send "Moving to $activemonitor$1"
hyprctl dispatch moveworkspacetomonitor "$activemonitor$1" "$activemonitor"
#hyprctl dispatch focusmonitor "$activemonitor"
hyprctl dispatch workspace "$activemonitor$1"
