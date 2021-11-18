#!/bin/bash
x=5
y=100

str1='this is a string'
str2='this is different string'

if [ $x = $y ]
then 
  echo "X is equal to Y!"
fi

if [ $x != $y ]
then 
  echo "X does not equal Y"
fi

if [ $str1 != $str2 ]
then 
  echo "These strings do not match."
  echo "Exiting this script."
  exit
fi

if [ $x -gt $y ]
then
  echo "$x is greater than $y".
fi

if [ $x -lt $y ]
then 
  echo "$x is less than $y!"
else
  echo "$x is not less than $y!"
fi

if [ $str1 = 'this string' ] && [ $x -gt $y ]
then
  echo "Those strings match and $x is greater than $y!"
else
  echo "Either those strings don't match, or $x is not greater than $y"
fi

if [ $str1 != $str2 ] || [ $x -lt $y ]
then
  echo "Either those strings don't match OR $x is less than $y!"
else
  echo "Those strings match, AND $x is not less than $y"
fi

if [ -d /etc ]
then
  echo "The /etc directory exists!"
fi

if [ ! -d /my_cool_folder ]
then 
  echo "my_cool_folder isn\'t there!"
fi

if [ -f /my_file.txt ]
then
  echo "my_file.txt is there"
fi

if [ $USER != 'sysadmin' ]
then 
  echo "You are not the sysadmin!"
  exit
fi

if [ $UID -ne 1000 ]
then
  echo "Your UID is wrong"
  exit
fi

if [ $(whoami) = 'sysadmin' ]
then
  echo "You are sysadmin!"
fi

