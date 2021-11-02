#!/bin/zsh
source ~/.zshrc

# ZSH SETUP
# AGNOSTER DEFAULT
sed -i'.zshrc_backup' 's/robbyrussell/agnoster/g' ~/.zshrc
cat >> ~/.zshrc << EZS3
export M2_HOME=/usr/local/maven
export MAVEN_HOME=/usr/local/maven
export PATH=\${M2_HOME}/bin:/Library/PostgreSQL/13/bin:\${PATH}
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
export ANDROID_SDK=/Users/$USER/Library/Android/sdk
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:/Users/$USER/Library/Android/sdk/emulator:/Users/$USER/Library/Android/sdk/tools:\$PATH
EZS3
source ~/.zshrc
