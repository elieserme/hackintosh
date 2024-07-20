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
brew install --cask cyberduck
brew install --cask balenaetcher

### development
brew install --cask visual-studio-code
brew install --cask imageoptim
brew install --cask insomnia
brew install --cask discord
brew install --cask dbeaver-community
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
brew install --cask dropbox
brew install parallel
brew install webp
brew install graphviz

### asdf 
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add python
asdf plugin add quarkus
cat >> ~/.asdfrc << EZS4
java_macos_integration_enable = yes
EZS4

### postgresql client
# brew install libpq
# brew link --force libpq

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
brew install --cask gimp
brew install --cask keka
brew install --cask iina
brew install yt-dlp
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

### NTFS support
brew install gromgit/fuse/ntfs-3g-mac
brew install --cask mounty

### YOUTUBE DOWNLOAD SCRIPT
sudo tee /usr/local/bin/youtube-download > /dev/null << YZS1
#!/bin/bash
yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 \$1
YZS1
sudo chmod +x /usr/local/bin/youtube-download

### YOUTUBE MUSIC DOWNLOAD SCRIPT
sudo tee /usr/local/bin/youtube-music-download > /dev/null << YZS1
#!/bin/bash
yt-dlp -x --audio-format mp3 \$1
YZS1
sudo chmod +x /usr/local/bin/youtube-music-download

### SITE DOWNLOAD SCRIPT
sudo tee /usr/local/bin/site-download > /dev/null << YZS1
#!/bin/bash
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent \$1
YZS1
sudo chmod +x /usr/local/bin/site-download

### fonts
fonts_list=(
  font-3270-nerd-font
  font-fira-mono-nerd-font
  font-inconsolata-go-nerd-font
  font-inconsolata-lgc-nerd-font
  font-inconsolata-nerd-font
  font-monofur-nerd-font
  font-overpass-nerd-font
  font-ubuntu-mono-nerd-font
  font-agave-nerd-font
  font-arimo-nerd-font
  font-anonymice-nerd-font
  font-aurulent-sans-mono-nerd-font
  font-bigblue-terminal-nerd-font
  font-bitstream-vera-sans-mono-nerd-font
  font-blex-mono-nerd-font
  font-caskaydia-cove-nerd-font
  font-code-new-roman-nerd-font
  font-cousine-nerd-font
  font-daddy-time-mono-nerd-font
  font-dejavu-sans-mono-nerd-font
  font-droid-sans-mono-nerd-font
  font-fantasque-sans-mono-nerd-font
  font-fira-code-nerd-font
  font-go-mono-nerd-font
  font-gohufont-nerd-font
  font-hack-nerd-font
  font-hasklug-nerd-font
  font-heavy-data-nerd-font
  font-hurmit-nerd-font
  font-im-writing-nerd-font
  font-iosevka-nerd-font
  font-jetbrains-mono-nerd-font
  font-lekton-nerd-font
  font-liberation-nerd-font
  font-meslo-lg-nerd-font
  font-monoid-nerd-font
  font-mononoki-nerd-font
  font-mplus-nerd-font
  font-noto-nerd-font
  font-open-dyslexic-nerd-font
  font-profont-nerd-font
  font-proggy-clean-tt-nerd-font
  font-roboto-mono-nerd-font
  font-sauce-code-pro-nerd-font
  font-shure-tech-mono-nerd-font
  font-space-mono-nerd-font
  font-terminess-ttf-nerd-font
  font-tinos-nerd-font
  font-ubuntu-nerd-font
  font-victor-mono-nerd-font
)

brew tap homebrew/cask-fonts

for font in "${fonts_list[@]}"
do
  brew install --cask "$font"
done
exit

