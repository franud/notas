#!/bin/bash

usage(){
	printf "Usage: make_backup.sh -s [path to backup] -d [where to save it] -c\n-s aka source\n-d aka destination\n-c aka compression\n"
	exit
}

source_path=''
destination_path=''
compression='false'

# El : indica que viene texto seniore
while getopts "s:d:c" arg; do
	case $arg in
		s) source_path=$OPTARG ;;
		d) destination_path=$OPTARG ;;
		c) compression='true' ;;
		*) usage ;;
	esac

done

echo $source_path $destination_path $compression

if [[ "$source_path" == "" ||  "$destination_path" == "" ]]; then
	usage
fi

if [[ ! -d "$source_path" || ! -d "$destination_path" ]]; then
	usage
fi

date=$(date -u +"%d%m%Y-%H%M")
nombresinbarras=$(echo $source_path | sed 's/\///g')
filename=backup-level0-$nombresinbarras-$date
if [[ "$compression" == "false" ]]; then
	echo "Backup de $source_path en $destination_path a las $date sin compresion"
	tar cfv $(realpath $destination_path)/$filename.tar $(realpath $source_path)
fi

if [[ "$compression" == "true" ]]; then
	echo "Backup de $source_path en $destination_path a las $date con compresion"
	tar czfv $(realpath $destination_path)/$filename.tar.gz $(realpath $source_path)
fi

echo "[*] DONE! :D"



