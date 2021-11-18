#!/bin/bash

packages=(
    'nano'
    'wget'
    'net-tools'
)

for package in ${packages[@]};
do
    if [ $(which $package) ]
    then 
        echo "$package is installed at $(which $package)."
    else
        echo "$package is not installed."
    fi
done


for user in $(ls /home);
do   
    for item in $(find /home/$user -iname '*.sh');
    do 
        echo -e "Found a script in $user's home folder! \n$item"
    done
done


for script in $(ls ~/scripts);
do 
    if [ ! -x ~/scripts/$script ]
    then
        chmod +x ~/scripts/$script
    fi
done


for file in $(ls ~/Documents/files_for_hashing/);
do
    sha256sum $file
done

