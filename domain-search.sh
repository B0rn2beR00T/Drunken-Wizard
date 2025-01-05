#!/bin/bash

#Drunken Wizard
#Autor: B0rn2beR00T

read -p "Target name (Exemple - wikipedia.org): " target

dom1=$(echo $target | cut -d "." -f 1) 
dom2=$(echo $target | cut -d "." -f 2) 

wget -q $target 

echo "Domains:"
grep -o "[^/]*\."$dom1"\.$dom2" index.html | sort -u > dom_list.txt 
cat dom_list.txt | nl
echo ""
echo "IPs:"

for url in $(cat dom_list.txt); do host $url; done | grep "has address" | cut -d " " -f 4 | nl > ip_list.txt
cat ip_list.txt

rm index.html
