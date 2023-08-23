#!/bin/bash

dir="/home/hiago/tdx/oe"
folders=($(find $dir -maxdepth 1 -type d -printf '%f\n' | grep -v -E "oe|bin"))

options=()
for ((i=0; i<${#folders[@]}; i++)); do
	options+=("$((i+1))" "${folders[$i]}")
done

choice=$(dialog --clear --menu "Select an option:" 15 35 6 "${options[@]}" 2>&1 >/dev/tty)

selected_folder=""
for ((i=0; i<${#options[@]}; i+=2)); do
	if [[ "${options[$i]}" == "$choice" ]]; then
		selected_folder="${options[$((i+1))]}"
		break
	fi
done

if [[ -n "$selected_folder" ]]; then
	if [[ "$selected_folder" == *"2.8"* ]]; then
		docker run --rm -it --privileged -v /media/hiago/data_ssd/oe/${selected_folder}/:/home/rocko/${selected_folder}/ -v /tmp:/tmp  -e DISPLAY=$DISPLAY hiagofranco/yocto-rocko:latest
	
	elif [[ "$selected_folder" == *"5"* ]]; then
		docker run --rm -it --privileged -v /media/hiago/data_ssd/oe/${selected_folder}/:/home/dunfell/${selected_folder}/ -v /tmp:/tmp  -e DISPLAY=$DISPLAY hiagofranco/yocto-dunfell:latest

	elif [[ "$selected_folder" == *"6"* ]]; then
		docker run --rm -it --privileged -v /media/hiago/data_ssd/oe/${selected_folder}/:/home/kirkstone/${selected_folder}/ -v /tmp:/tmp  -e DISPLAY=$DISPLAY hiagofranco/yocto-kirkstone:latest
	fi
else
	echo "Invalid choice. Please try again."
fi
# clear the screen
clear
