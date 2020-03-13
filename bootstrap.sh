#! /usr/bin/env zsh

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

PROJECT_DIR=$( cd "$( dirname $0 )" && pwd )
INIT_WORKSPACE_DIR=$HOME
WORKSPACE_DIR="${HOME}/Workspace"

cd $INIT_WORKSPACE_DIR

echo -e "${GREEN}===== Installing Command Line Tools... =====${NOCOLOR}"

if ! xcode-select -p &> /dev/null; then
    xcode-select --install
fi

## macOS settings
(exec "${PROJECT_DIR}/macOS/set-defaults.sh")

# Check for Homebrew,
if ! (( $+commands[brew] )); then
  echo -e "${GREEN}===== Installing homebrew... =====${NOCOLOR}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo -e "${GREEN}===== Updating homebrew... =====${NOCOLOR}"
brew update

brew install zsh bash \
    git \
    ansible \
    go \
    tree \
    tig \
    watch \
    ffmpeg media-info \
    hugo \
    Graphviz \
    imagemagick \
    ghostscript

brew cask install iterm2 \
    google-chrome google-backup-and-sync \
    homebrew/cask-versions/google-chrome-canary \
    homebrew/cask-fonts/font-hack-nerd-font \
    firefox \
    evernote notion \
    spotify vlc iina vox \
    slack \
    sublime-text \
    visual-studio-code \
    phpstorm goland \
    sequel-pro \
    sourcetree fork \
    docker \
    alfred3 \
    drawio \
    skitch \
    telegram \
    mipony \
    mediainfo \
    welly nally \
    macdown \
    postman \
    cyberduck \
    the-unarchiver \
    another-redis-desktop-manager \
    google-cloud-sdk

brew cleanup

# 把 zsh 加進 shell 清單
# http://linux.vbird.org/linux_basic/0320bash.php#bash_shells
if grep -q $(which zsh) /etc/shells; then
    sudo sh -c "echo $(which zsh) >> /etc/shells"
fi

# 把 zsh 設定為你的預設 shell
# http://linux.vbird.org/linux_basic/0410accountmanager.php#chsh
if [[ $(dscl . -read ~/ UserShell | sed 's/UserShell: //') != $(which zsh) ]]; then
    chsh -s $(which zsh)
fi

# oh-my-zsh
if [ ! -d "$HOME"/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
fi

if [ ! -d "$HOME"/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel9k
fi

# Creating an SSH key
ssh-keygen -q -t rsa -b 4096 -N "" -C "for GitHub" -f "$HOME"/.ssh/key_for_github
ssh-keygen -q -t rsa -b 4096 -N "" -C "for GitLab" -f "$HOME"/.ssh/key_for_gitlab
cp -f "${PROJECT_DIR}"/dotfiles/ssh/config "$HOME"/.ssh/config

# dotfiles

## zsh
cp -f "${PROJECT_DIR}"/dotfiles/zsh/zsh-run-commands "$HOME"/.zshrc

## iTerm2
## https://www.iterm2.com/documentation-dynamic-profiles.html
## ~/Library/Application Support/iTerm2/DynamicProfiles
ITERM2_DYAMIC_PROFILES_FOLDER="${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
if [ ! -d "$ITERM2_DYAMIC_PROFILES_FOLDER" ]; then
    mkdir -p "${ITERM2_DYAMIC_PROFILES_FOLDER}"
fi
cp -f "${PROJECT_DIR}"/dotfiles/iTerm2/profiles.json "${ITERM2_DYAMIC_PROFILES_FOLDER}"/profiles.json
cp -f "${PROJECT_DIR}"/dotfiles/iTerm2/com.googlecode.iterm2.plist "${HOME}"/Library/Preferences

## Git
cp -f "${PROJECT_DIR}"/dotfiles/git/git-configuration "$HOME"/.gitconfig
cp -f "${PROJECT_DIR}"/dotfiles/git/gitignore "$HOME"/.gitignore

## sublime
SUBLIME_MIAN_FOLDER="${HOME}/Library/Application Support/Sublime Text 3"
SUBLIME_INSTALLED_PACKAGES_FOLDER="${SUBLIME_MIAN_FOLDER}/Installed Packages"
SUBLIME_SETTING_FOLDER="${SUBLIME_MIAN_FOLDER}/Packages/User"
if [ ! -d "$SUBLIME_INSTALLED_PACKAGES_FOLDER" ]; then
    mkdir -p "${SUBLIME_INSTALLED_PACKAGES_FOLDER}"
fi

if [ ! -d "$SUBLIME_SETTING_FOLDER" ]; then
    mkdir -p "${SUBLIME_SETTING_FOLDER}"
fi
cp "${PROJECT_DIR}/dotfiles/sublime/Package Control.sublime-package" "${SUBLIME_INSTALLED_PACKAGES_FOLDER}"
cp -R -f "${PROJECT_DIR}"/dotfiles/sublime/* "${SUBLIME_SETTING_FOLDER}"

## vim
cp -f "${PROJECT_DIR}"/dotfiles/vim/vimrc "$HOME"/.vimrc

## ssh

if [ ! -d $WORKSPACE_DIR ]; then
    mkdir $WORKSPACE_DIR
fi

sudo reboot


