#!/usr/bin/env bash

function network() {
    nm-applet&
}

function volume() {
    if [ $(ps aux | grep "$(readlink -f `which volctl` | cut -d/ -f1-4)[/]" | wc -l) -eq "0" ]; then 
        volctl&
    fi
}

network
volume
