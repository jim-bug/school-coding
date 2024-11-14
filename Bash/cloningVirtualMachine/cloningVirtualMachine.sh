#!/bin/bash
# Author: Ignazio Leonardo Calogero Sperandeo
# Date: 10/11/2024
# Project: Script for creating and cloning a new VM.
# by jim_bug // :)

function show_help {
	echo "Usage: ./$0 [OPTION]..."
	echo ""
	echo "Options:"
	echo "  -h, --help        	It shows help."
	echo "  -n		  	Name of a VM, default: vbox"
	echo "  -o		  	OS type of VM, default: Linux_64, you can see with: VBoxManage list ostypes."
	echo "  -p   		  	Path of .vdi"
	echo ""
}

name="vbox"
os="Linux_64"
path_vdi=""
network_int=$(ip -br link | grep -m 1 "e" | awk '{print $1}') 

while getopts "hn:o:p:" opt; do
    case "$opt" in
        h)  show_help
            exit 0
            ;;
        n)  name="$OPTARG"
            ;;
        o)  os="$OPTARG"
            ;;
        p)  path_vdi="$OPTARG"
            ;;
        \?)
            echo "Bad option"
	    show_help
            exit 1
            ;;
    esac
done

if [[ -f "$path_vdi" ]]; then
	VBoxManage createvm --name "$name" --ostype "$os" --register
	VBoxManage modifyvm "$name" --memory 4096 --cpus 2
	VBoxManage storagectl "$name" --name "SATA Controller" --add sata --controller IntelAhci
	VBoxManage storageattach "$name" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  "$path_vdi"
	VBoxManage modifyvm "$name" --nic1 bridged --bridgeadapter1 "$network_int"
	VBoxManage clonevm "$name" --name "${name}_clone" --register
	VBoxManage startvm "${name}_clone"
else
	echo "File $path non esistente, ricontrollare la path $path."
fi

# // :) 
