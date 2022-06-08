#!/bin/bash
sudo pmset -a proximitywake 0
sudo pmset -a hibernatemode 0
sudo pmset -a powernap 0
sudo pmset -a networkoversleep 0
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool yes
pmset -g live