#!/bin/bash

nums=$(echo {0..9})
states=('Nebraska' 'California' 'Texas' 'Hawaii' 'Washington')
ls_out=$(ls)

execs=$(find /home -type f -perm 777 2>/dev/null)

for num in ${nums[@]}; do
  if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]; then
    echo $num
  fi
done

for state in ${states[@]}; do
  if [ $state == 'Hawaii' ]; then
    echo "Hawaii is the best!"
  else
    echo "I'm not a fan of Hawaii."
  fi
done

for x in ${ls_out[@]}; do
  echo $x
done

for exec in ${execs[@]}; do
  echo $exec

done

