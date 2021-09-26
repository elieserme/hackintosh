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
brew tap heroku/brew && brew install heroku
brew install --cask dbeaver-community
brew install --cask figma
brew install --cask brave-browser
brew install --cask intellij-idea-ce
brew install --cask pycharm-ce
brew install gettext
brew install --cask github
brew install gh
brew install libpq
brew link --force libpq

### mobile dev
brew install --cask android-studio
brew install --cask flutter
sudo gem install cocoapods
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

### vegeta
brew install vegeta
brew install --cask iterm2
brew install rs/tap/jaggr
brew install rs/tap/jplot

### apps
brew install --cask appcleaner
brew install --cask lunar
brew install --cask geekbench
brew install --cask fliqlo
brew install --cask authy
brew install --cask gimp
brew install --cask keka
brew install --cask vlc
brew install youtube-dl
brew install ffmpeg
brew install libdvdcss
brew install --cask handbrake
brew install --cask zoom

### removed for stability - do not use unless you really need it
# brew install --cask intel-power-gadget
# brew install --cask osxfuse
# brew install --cask veracrypt

### awscli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
rm AWSCLIV2.pkg

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

### GPU MONITOR SCRIPT
sudo tee /usr/local/bin/gpu-monitor > /dev/null << YZS1
#!/bin/bash
while sleep 1; do clear;ioreg -l |grep \\"PerformanceStatistics\\" | cut -d '{' -f 2 | tr '|' ',' | tr -d '}' | tr ',' '\\n'|grep 'Temp\\|Fan\\|Clock'; done
YZS1
sudo chmod +x /usr/local/bin/gpu-monitor
