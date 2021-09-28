#!/bin/zsh
source ~/.zshrc

# ZSH SETUP
# AGNOSTER DEFAULT, SPACESHIP AS AN OPTION
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i'.zshrc_backup' 's/robbyrussell/agnoster/g' ~/.zshrc
cat >> ~/.zshrc << EZSH
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  venv          # Python virtualenv
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
export DEFAULT_USER=\$USER
EZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
cat >> ~/.zshrc << EZS2
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
EZS2
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
