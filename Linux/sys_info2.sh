#!/bin/bash

if [ $UID -ne 0 ]; then
  echo "Please run this script as root."
  exit
fi

output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(sudo find /home -type f -perm 777 2>/dev/null)
cpu=$(lscpu | grep CPU)
disk=$(df -H | head -2)

commands=(
  'date'
  'uname -a'
  'hostname -s'
)

files=(
  '/etc/passwd'
  '/etc/shadow'
)

if [ ! -d $HOME/research ]; then
  mkdir $HOME/research
fi

if [ -f $output ]; then
  >$output
fi


echo "A Quick System Audit Script" >>$output
echo "" >>$output

for x in {0..2}; do
  results=$(${commands[$x]})
  echo "Results of "${commands[$x]}" command:" >>$output
  echo $results >>$output
  echo "" >>$output
done

echo "Machine Type Info:" >>$output
echo -e "$MACHTYPE \n" >>$output

echo -e "IP Info:" >>$output
echo -e "$ip \n" >>$output

echo -e "\nMemory Info:" >>$output
free >>$output

echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output

echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output

echo -e "\nCurrent user login information: \n $(who -a) \n" >>$output

echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output

echo -e "\nexec Files:" >>$output
for exec in $execs; do
  echo $exec >>$output
done

echo -e "\nTop 10 Processes" >>$output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >>$output

echo -e "\nThe permissions for sensitive /etc files: \n" >>$output
for file in ${files[@]}; do
  ls -l $file >>$output
done

