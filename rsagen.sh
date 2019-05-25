#!/bin/bash

if [ -e $HOME/.rnd ]; then
    urand=$HOME/.rnd
else
    urand=/dev/urandom
fi

function pause() {
    read -p "Press [ENTER] to continue... " fackEnterKey
}

function setup() {
    read -p "Please enter the filepath for the private key output: " outkey
    read -p "Please enter a keysize[4096]: " bits
    pause
}

function rsagen() {
    openssl genrsa -rand ${urand} -out ${outkey} ${bits}
    pause
}

function dhpgen() {
    read -p "Please enter a filepath for output" dhout
    read -p "Please enter a size[2048]: " dhbits
    openssl dhparam -rand ${urand} -outform PEM -out ${dhout} -2 ${dhbits}
}

function menu() {
    echo " "
    echo " +=======================+ "
    echo " | MENU                  | "
    echo " | 1 setup               | "
    echo " | 2 gen rsa p. key      | "
    echo " | 3 gen dh params       | "
    echo " | 4 exit                | "
    echo " +=======================+ "
    echo " "
}

function choice() {
    local mchoice
    read -p "Please select [1-3] " mchoice
    case ${mchoice} in
        [1]) setup ;;
        [2]) rsagen ;;
        [3]) dhpgen ;;
        [4]) exit 0 ;;
          *) echo -e "Error..." && sleep 3
    esac
}

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
    menu
    choice
done
