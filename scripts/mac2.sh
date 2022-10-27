#!/bin/zsh
source ~/.zshrc

### NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

### SDK MAN
curl -s "https://get.sdkman.io" | bash

### MAVEN FOR JAVA
curl -L https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz -o maven.tar.gz
sudo tar xf maven.tar.gz -C /usr/local
sudo ln -s /usr/local/apache-maven-3.8.6 /usr/local/maven

### MAMP 5.7 CONFIG
cat > /Applications/MAMP/conf/my.cnf << 'EOF'
[mysqld]
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
EOF

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
