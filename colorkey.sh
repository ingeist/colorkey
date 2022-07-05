#!/bin/bash 

# basic usage of colorkey.sh is ./colorkey.sh <33 HEX BYTE BITCOIN KEY>
# this produces the default behavior of background color + space foreground
# -s show hex bytes - background color + hex byte foreground
# -i invert - colorize hex bytes as foreground

key=$1
for (( i=0; i< ${#key}; i+=6));
	do hextriple=${key:i:6};
	red=${hextriple:0:2};
	green=${hextriple:2:2};
	blue=${hextriple:4:2};
	
	# background
	printf "\033[48;2;%d;%d;%dm" $((16#$red)) $((16#$green)) $((16#$blue));
	# foreground
	printf "\033[38;2;%d;%d;%dm" $((255-$((16#$red)))) $((255-$((16#$green)))) $((255-$((16#$blue))));
	# text 
	printf "   \033[0m";# $hextriple;
done
printf "\n"
