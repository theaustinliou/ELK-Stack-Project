#!/bin/bash

if [ $UID -eq 0 ]; then
  echo "Please do not run this script as root."
  exit
fi

output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(sudo find /home -type f -perm 777 2>/dev/null)

if [ ! -d $HOME/research ]; then
  mkdir $HOME/research
fi

if [ -f $output ]; then
  rm $output
fi


echo "A Quick System Audit Script" > ~/research/sys_info.txt
date >> ~/research/sys_info.txt
echo "" >> ~/research/sys_info.txt
echo "Machine Type Info:" >> ~/research/sys_info.txt
echo $MACHTYPE >> ~/research/sys_info.txt
echo -e "Uname info: $(uname -a) \n" >> ~/research/sys_info.txt
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> ~/research/sys_info.txt
echo -e "Hostname: $(hostname -s) \n" >> ~/research/sys_info.txt
echo "DNS Servers: " >> ~/research/sys_info.txt
cat /etc/resolv.conf >> ~/research/sys_info.txt
echo -e "\nMemory Info:" >> ~/research/sys_info.txt
free >> ~/research/sys_info.txt
echo -e "\nCPU Info:" >> ~/research/sys_info.txt
lscpu | grep CPU >> ~/research/sys_info.txt
echo -e "\nDisk Usage:" >> ~/research/sys_info.txt
df -H | head -2 >> ~/research/sys_info.txt
echo -e "\nWho is logged in: \n $(who -a) \n" >> ~/research/sys_info.txt
echo -e "\nSUID Files:" >> ~/research/sys_info.txt
find / -type f -perm /4000 >> ~/research/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research/sys_info.txt


