#!/bin/zsh
source ~/.zshrc

### RUST COMPILER
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

### AGNOSTER DEFAULT
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i'.zshrc_backup1' 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
sed -i'.zshrc_backup2' 's/robbyrussell/agnoster/g' ~/.zshrc
cat >> ~/.zshrc << EZS3
export DEFAULT_USER=\$USER
export ANDROID_SDK=/Users/$USER/Library/Android/sdk
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:/Users/$USER/Library/Android/sdk/emulator:/Users/$USER/Library/Android/sdk/tools:\$PATH
EZS3
source ~/.zshrc

### NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

### SDKMAN
curl -s "https://get.sdkman.io" | bash

### UV
curl -LsSf https://astral.sh/uv/install.sh | sh