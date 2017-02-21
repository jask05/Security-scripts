#!/bin/bash
#
# Automatize Slor Loris check
#

# 12.12.12.12 14.14.14.14

echo -e "
------------------------------------------------------------------
Slow Loris check!
------------------------------------------------------------------
\n"

# Checking if nmap is installed
nmap -V check >/dev/null 2>&1 || { echo >&2 "NOTE: I require nmap but it's not installed. Aborting."; exit 1; }

# Set IP
echo -n "> Please, type IP separated by space: "
read -a source
#size=${#source[*]}
for i in "${source[@]}"
do
	#nmap -T4 -A -p 80 -v --script http-slowloris-check "$item" > slowloris-check_"$item"_80__"$(date +'%Y%m%d')".log
	#nmap -T4 -A -p 443 -v --script http-slowloris-check ${source[*]} > "slowloris-check_${source[*]}_443__$(date +'%Y%m%d').log"
	nmap -T4 -A -p 80 -v --script http-slowloris-check $i
	nmap -T4 -A -p 443 -v --script http-slowloris-check $i
done