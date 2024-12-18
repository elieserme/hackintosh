#!/bin/zsh
source ~/.zshrc

### MAMP 5.7 CONFIG
cat > /Applications/MAMP/conf/my.cnf << 'EOF'
[mysqld]
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
EOF

### RUST COMPILER
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

### AGNOSTER DEFAULT
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i'.zshrc_backup1' 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
sed -i'.zshrc_backup2' 's/robbyrussell/agnoster/g' ~/.zshrc
cat >> ~/.zshrc << EZS3
export DEFAULT_USER=\$USER
export PATH=/Library/PostgreSQL/16/bin:\${PATH}
export ANDROID_SDK=/Users/$USER/Library/Android/sdk
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:/Users/$USER/Library/Android/sdk/emulator:/Users/$USER/Library/Android/sdk/tools:\$PATH
EZS3
source ~/.zshrc
