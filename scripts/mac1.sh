#!/bin/bash

### INSTALL FIRST
### XCODE WITH COMMAND LINE TOOLS
### JAVA 11, PYTHON 3.9.7 AND PGSQL 13.4
### CHANGE TO ZSH (on older OSX): chsh -s /bin/zsh

git config --global user.name "Me"
git config --global user.email "me@me.com"
git config --global init.defaultBranch main
git config --global pull.rebase false

### nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
