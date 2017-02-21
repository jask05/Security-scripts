#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
	    whois $line > /tmp/whois/$line".log"
done < "$1"
