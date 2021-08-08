#!/bin/bash
sudo pmset proximitywake 0
sudo pmset -a hibernatemode 3
sudo pmset -a standbydelaylow 7200
sudo pmset -a standbydelayhigh 7200
pmset -g live