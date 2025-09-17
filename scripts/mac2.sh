#!/bin/zsh

### Need HomeBrew installed first (https://brew.sh)
### /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
### Need XCode install first

### source changes and oh-my-zsh installation on previous step
source ~/.zshrc

### agnoster for oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i'.zshrc_backup1' 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
sed -i'.zshrc_backup2' 's/robbyrussell/agnoster/g' ~/.zshrc

### tools like linux
brew install wget
brew install imagemagick
brew install graphicsmagick
brew install yt-dlp
brew install ffmpeg
brew install libdvdcss
brew install gettext
brew install neofetch

### web navigation
brew install --cask google-chrome

### development
### mise and python uv
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc
curl -LsSf https://astral.sh/uv/install.sh | sh
### tools
brew install --cask visual-studio-code
brew install --cask imageoptim
brew install --cask figma
brew install --cask insomnia
brew install --cask discord
brew install --cask intellij-idea
brew install --cask pycharm
brew install --cask microsoft-teams
brew install --cask dropbox
brew install docker
brew install --cask docker

### mobile dev
brew install --cask android-studio
cat >> ~/.zshrc << EZS3
export DEFAULT_USER=\$USER
export ANDROID_SDK=/Users/$USER/Library/Android/sdk
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:/Users/$USER/Library/Android/sdk/emulator:/Users/$USER/Library/Android/sdk/tools:\$PATH
EZS3
source ~/.zshrc

### git instead of apple git
brew install git
git config --global user.name "MacMe"
git config --global user.email "me@me.com"
git config --global init.defaultBranch main
git config --global pull.rebase false

# brew install git 
brew install --cask github
brew install gh

### apps
brew install --cask appcleaner
brew install --cask betterdisplay
brew install --cask gimp
brew install --cask inkscape
brew install --cask keka
brew install --cask iina
brew install --cask handbrake
brew install --cask zoom
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask spotify
brew install --cask whatsapp
brew install --cask transmission
brew install --cask cyberduck
brew install --cask balenaetcher

### hackintosh
brew install --cask hackintool

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

for font in "${fonts_list[@]}"
do
  brew install --cask "$font"
done
exit
