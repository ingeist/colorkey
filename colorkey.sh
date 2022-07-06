#!/bin/bash 

# basic usage of colorkey.sh is ./colorkey.sh <33 HEX BYTE BITCOIN KEY>
# this produces the default behavior of background color + space foreground

# TODO no arguments: block-style output
# -f fg: text is colored 
# -f bg: background is colored, text is colored as 255-color
# -f blocks: block-style output 


function usage {
printf "usage: 	$0 [options] <BTC Key>
	$0 <BTC Key>
	$0 -f <fg|bg|blocks> <BTC Key>
	$0 -h
	options:
		-f <fg|bg|blocks>	output the key in either foreground color, background color, or as blocks (default behavior)
		-h			show this text\n"
}


while getopts ":isf:" opt; do
	case $opt in
		f)
		format=$OPTARG;;
		h)
		usage
		exit 1;;
		*)
		usage
		exit 1;;
			
	esac
done


shift $(($OPTIND-1))
#test to see if the arguments are empty after the getopts business 
if [[ -z $1 ]]; then 
	usage;	
else
	key=$1;
fi


for (( i=0; i< ${#key}; i+=6));
	do hextriple=${key:i:6};
	red=${hextriple:0:2};
	green=${hextriple:2:2};
	blue=${hextriple:4:2};
	

	case $format in 
		"fg")
		# foreground
		printf "\033[38;2;%d;%d;%dm"  $((16#$red)) $((16#$green)) $((16#$blue));
		# hex text
		printf "%s\033[0m" $hextriple;
		;;
		"bg")
		# background 
		printf "\033[48;2;%d;%d;%dm" $((16#$red)) $((16#$green)) $((16#$blue));
		# opposite foreground
		printf "\033[38;2;%d;%d;%dm" $((255-$((16#$red)))) $((255-$((16#$green)))) $((255-$((16#$blue))));
		# hex text
		printf "%s\033[0m" $hextriple;
		;;
		"blocks")
		# background 
		printf "\033[48;2;%d;%d;%dm" $((16#$red)) $((16#$green)) $((16#$blue));
		# block text 
		printf "   \033[0m";
		;;
		*)
		usage
		exit 1;;
	esac
done

printf "\n"


