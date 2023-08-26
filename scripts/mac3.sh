#!/bin/bash

### Need HomeBrew installed first (https://brew.sh)
### /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

### wget like linux
brew install wget

### hugo static generator
brew install hugo
brew install imagemagick
brew install graphicsmagick

### web navigation
brew install --cask google-chrome
brew install --cask firefox
brew install --cask tor-browser
brew install --cask transmission

### development
brew install --cask visual-studio-code
brew install --cask imageoptim
brew install --cask insomnia
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask discord
brew install --cask dbeaver-community
brew install --cask sequel-pro
brew install --cask figma
brew install --cask sketch
brew install --cask brave-browser
brew install --cask intellij-idea-ce
brew install --cask pycharm-ce
brew install --cask microsoft-teams
brew install --cask microsoft-edge
brew install gettext
brew install neofetch
brew install --cask teamviewer
brew install asdf

### asdf plugins 
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add python
asdf plugin add quarkus

### postgresql client
brew install libpq
brew link --force libpq

### oracle client
brew tap InstantClientTap/instantclient
brew install instantclient-sqlplus
brew install sqlcl

### mobile dev
brew install --cask android-studio
brew install --cask flutter
sudo gem install cocoapods
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license accept

### git instead of apple git
brew install git
git config --global user.name "Me"
git config --global user.email "me@me.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
brew install git-crypt
brew install --cask github
brew install gh

### apps
brew install --cask appcleaner
brew install --cask monitorcontrol
brew install --cask fliqlo
brew install --cask authy
brew install --cask gimp
brew install --cask keka
brew install --cask iina
brew install youtube-dl
brew install ffmpeg
brew install libdvdcss
brew install --cask handbrake
brew install --cask zoom
brew install --cask istat-menus
brew install docker
brew install docker-compose

### hackintosh
brew install --cask hackintool
brew install --cask maciasl

### awscli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
rm AWSCLIV2.pkg

### veracrypt
brew install --cask macfuse
brew install --cask veracrypt

### YOUTUBE DOWNLOAD SCRIPT
sudo tee /usr/local/bin/youtube-download > /dev/null << YZS1
#!/bin/bash
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 \$1
YZS1
sudo chmod +x /usr/local/bin/youtube-download

### YOUTUBE MUSIC DOWNLOAD SCRIPT
sudo tee /usr/local/bin/youtube-music-download > /dev/null << YZS1
#!/bin/bash
youtube-dl -x --audio-format mp3 \$1
YZS1
sudo chmod +x /usr/local/bin/youtube-music-download

