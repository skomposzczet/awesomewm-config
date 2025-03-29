#!/usr/bin/env bash

function network() {
    nm-applet&
}

function comp() {
    picom -b
}

network
comp
