#!/usr/bin/env bash
#
# Sets up requirements to provision with ansible
#

#
# Clean display function
#
# usage:
#        display "My thing to output"
#
function display() {
    echo "-----> $1"
}

display "Installing xcode with git"
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n');
softwareupdate -i "$PROD" -v;
echo -ne '\n'; 

if [ ! `which pip` ]
then
    display "Installing pip"
    sudo easy_install pip
fi

if [ ! `which ansible` ]
then
    display "Installing ansible"
    sudo pip install ansible
fi