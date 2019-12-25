# Initial Script for Mac

## Preconditions
- macOS 10.15

## How To Use
Execute `bootstrap.sh` (Remember to enable execute permissions on all files)

## Components
- macOS configuration
- Homebrew
- Shell environment
- dotfiles

## Appications

### CommandLine Tools
- [Zsh](https://www.zsh.org/)
- [git](https://git-scm.com)
- [GO](https://golang.org)
- [Tree](http://mama.indstate.edu/users/ice/tree/)
- [Tig](https://jonas.github.io/tig/)
- [watch](https://gitlab.com/procps-ng/procps)
- [FFmpeg](https://ffmpeg.org/)
- [MediaInfo](https://mediaarea.net/)
- [Ansible](https://www.ansible.com/)

### GUI applications
- [iTerm2](https://www.iterm2.com/)
- [Chrome](https://www.google.com/chrome/)
- [Google Drive](https://www.google.com/drive/)
- [Canary](https://www.google.com/chrome/canary/)
- [Firefox](https://www.mozilla.org/firefox/)
- [Evernote](https://evernote.com/)
- [Notion](https://www.notion.so/)
- [Spotify](https://www.spotify.com/)
- [VLC](https://www.videolan.org/vlc/)
- [IINA](https://iina.io/)
- [VOX](https://vox.rocks/mac-music-player)
- [Slack](https://slack.com/)
- [Sublime Text](https://www.sublimetext.com/)
- [PhpStorm](https://www.jetbrains.com/phpstorm/)
- [GoLand](https://www.jetbrains.com/go/)
- [Sequel Ppro](https://www.sequelpro.com/)
- [Sourcetree](https://www.sourcetreeapp.com/)
- [Fork](https://git-fork.com/)
- [Docker](https://www.docker.com/products/container-runtime)
- [Alfred](https://www.alfredapp.com/)
- [draw.io](https://www.draw.io/)
- [Skitch](https://evernote.com/products/skitch)
- [Telegram](https://telegram.org/)
- [Mipony](https://mipony.net/)
- [MediaInfo](https://mediaarea.net/en/MediaInfo)
- [Welly](https://github.com/clyang/welly)
- [Nally](https://yllan.org/app/Nally/)
- [MacDown](https://macdown.uranusjr.com/)
- [Postman](https://www.getpostman.com/)
- [Cyberduck](https://cyberduck.io/)
- [The Unarchiver](https://theunarchiver.com/)
- [Another Redis DeskTop Manager](https://github.com/qishibo/AnotherRedisDesktopManager/)
- [Google Cloud SDK](https://cloud.google.com/sdk/)

### Fonts
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## macOS Configuration through command line

| Setting                   | Script                                                       |
|:--------------------------|:-------------------------------------------------------------|
| Empty Dock                | `$ defaults delete com.apple.dock persistent-apps`           |
|                           | `$ defaults delete com.apple.dock persistent-others`         |
| Put Dock on the lfet side | `$ defaults write com.apple.dock orientation -string "left"` |

## Releated

- macOS Catalina use [zsh as the default](https://support.apple.com/en-us/HT208050)








