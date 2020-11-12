#!/bin/bash
function check_pkg(){
    if [[ $(dpkg --get-selections|grep -w "python3"|head -1) =~ "python3" ]]
    then
        :
    else
        apt-get install python3 -y &>/dev/null
    fi
    if [[ $(dpkg --get-selections|grep -w "curl"|head -1) =~ "curl" ]]
    then
        :
    else
        apt-get install curl -y &>/dev/null
    fi
}

function download_zip(){
    curl -L -o /usr/bin/main.zip https://github.com/DumiduPramith/workon/archive/main.zip
}

function main(){
    check_pkg
    download_zip
    mkdir ~/workon
    python3 ~/workon/installer.py
    
}

if [ $(whoami) == 'root' ]
then
    main
else
    echo 'Please run as root'
fi
exit