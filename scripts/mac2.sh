#!/bin/zsh
source ~/.zshrc

### NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

### AGNOSTER DEFAULT
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i'.zshrc_backup1' 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
sed -i'.zshrc_backup2' 's/robbyrussell/agnoster/g' ~/.zshrc
cat >> ~/.zshrc << EZS3
export DEFAULT_USER=\$USER
export PATH=/Library/PostgreSQL/13/bin:\${PATH}
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
export ANDROID_SDK=/Users/$USER/Library/Android/sdk
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:/Users/$USER/Library/Android/sdk/emulator:/Users/$USER/Library/Android/sdk/tools:\$PATH
EZS3
source ~/.zshrc
