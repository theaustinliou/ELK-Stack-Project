#!/bin/bash

months=(
    'january'
    'february'
    'march'
    'april'
    'may'
    'june'
    'july'
    'august'
    'september'
    'october'
    'november'
    'december'
)
days=('mon' 'tues' 'wed' 'thur' 'fri' 'sat' 'sun')

# create for loops

#print out months
for month in ${months[@]}
do 
    echo $month
done

for day in ${days[@]}
do
    if [ $day = 'sun' ] || [ $day = 'sat' ]
    then 
        echo "It is the weekend! Take it easy."
    else
        echo "It is a weekday! Get to work!"
    fi 
done

for file in $(ls)
do
    ls -lah $file
done

for num in {0..5}
do 
    if [ $num = 1 ] || [ $num = 4 ]
    echo $num 
done



