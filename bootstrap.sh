#!/usr/bin/env bash

# https://segmentfault.com/a/1190000002713879

set -e

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

CURRENT_DIR=$PWD
PROJECT_DIR=$(dirname $0)
INIT_WORKSPACE_DIR=$HOME
WORKSPACE_DIR="$HOME/workspace"

cd $INIT_WORKSPACE_DIR

echo -e "${GREEN}===== Installing Command Line Tools... =====${NOCOLOR}"
if ! xcode-select -p &> /dev/null; then
    xcode-select --install
fi

## macOS
(exec "${PROJECT_DIR}"/macOS/set-defaults.sh)

# Check for Homebrew,
if test ! $(which brew); then
  echo -e "${GREEN}===== Installing homebrew... =====${NOCOLOR}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo -e "${GREEN}===== Updating homebrew... =====${NOCOLOR}"
brew update

brew install zsh \
    git \
    ansible \
    go \
    tree \
    tig \
    watch \
    ffmpeg \
    media-info

brew cask install iterm2 \
    google-chrome google-backup-and-sync \
    homebrew/cask-versions/google-chrome-canary \
    homebrew/cask-fonts/font-hack-nerd-font \
    firefox \
    evernote notion \
    spotify vlc iina vox \
    slack \
    sublime-text \
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
sudo sh -c "echo $(which zsh) >> /etc/shells"

# 把 zsh 設定為你的預設 shell
# http://linux.vbird.org/linux_basic/0410accountmanager.php#chsh
chsh -s $(which zsh)

# oh-my-zsh
if [ ! -d "$HOME"/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
fi

if [ ! -d "$HOME"/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel9k
fi

# Creating an SSH key
ssh-keygen -q \
    -b 4096 \
    -t rsa \
    -N "" \
    -C "for sourcetree" \
    -f "$HOME"/.ssh/id_rsa_for_github_through_sourcetree

# dotfiles

## zsh
ln -f -s "${PROJECT_DIR}"/dotfiles/zsh/zsh-run-commands "$HOME"/.zshrc

## iTerm2
## https://www.iterm2.com/documentation-dynamic-profiles.html
## ~/Library/Application Support/iTerm2/DynamicProfiles
ITERM2_DYAMIC_PROFILES_FOLDER="${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
if [ ! -d "$ITERM2_DYAMIC_PROFILES_FOLDER" ]; then
    mkdir -p "${ITERM2_DYAMIC_PROFILES_FOLDER}"
fi
ln -f -s "${PROJECT_DIR}"/dotfiles/iTerm2/profiles.json "${ITERM2_DYAMIC_PROFILES_FOLDER}"/profiles.json
ln -f -s "${PROJECT_DIR}"/dotfiles/iTerm2/com.googlecode.iterm2.plist "${HOME}"/Library/Preferences

## Git
ln -f -s "${PROJECT_DIR}"/dotfiles/git/git-configuration "$HOME"/.gitconfig
ln -f -s "${PROJECT_DIR}"/dotfiles/git/gitignore "$HOME"/.gitignore

## sublime
SUBLIME_MIAN_FOLDER="${HOME}/Library/Application Support/Sublime Text 3"
SUBLIME_INSTALLED_PACKAGES_FOLDER="${SUBLIME_MIAN_FOLDER}/Installed Packages"
SUBLIME_SETTING_FOLDER="${SUBLIME_MIAN_FOLDER}/Packages/User"
if [ ! -d "$SUBLIME_INSTALLED_PACKAGES_FOLDER" ]; then
    mkdir "${SUBLIME_INSTALLED_PACKAGES_FOLDER}"
fi
cp "${PROJECT_DIR}/dotfiles/sublime/Package Control.sublime-package" "${SUBLIME_INSTALLED_PACKAGES_FOLDER}"
# ln -f -s "${PROJECT_DIR}"/dotfiles/sublime/Package-Control.sublime-settings "${SUBLIME_SETTING_FOLDER}"/"Package Control.sublime-settings"
# ln -f -s "${PROJECT_DIR}"/dotfiles/sublime/Preferences.sublime-settings "${SUBLIME_SETTING_FOLDER}"/Preferences.sublime-settings
ln -f -s "${PROJECT_DIR}"/dotfiles/sublime/* "${SUBLIME_SETTING_FOLDER}"

## vim
ln -f -s "${PROJECT_DIR}"/dotfiles/vim/vimrc "$HOME"/.vimrc

## ssh

if [ ! -d $WORKSPACE_DIR ]; then
    mkdir $WORKSPACE_DIR
fi

sudo reboot


