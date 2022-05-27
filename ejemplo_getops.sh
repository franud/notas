#!/bin/bash

usage(){
	printf "Usage: fran\n"
}

# El : indica que viene texto seniore
while getopts "fran:" arg; do
	case $arg in
		f) echo "Opcion f" ;;
		r) echo "Opcion r" ;;
		a) echo "Opcion a" ;;
		n) name=$OPTARG ;;
		*) usage
	esac
done

echo $name
