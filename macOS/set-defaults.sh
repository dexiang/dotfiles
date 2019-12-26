# Awesome macOS Command Line
# https://github.com/herrbischoff/awesome-macos-command-line

# 關閉 Time Machine X
# sudo tmutil disablelocal
# sudo tmutil disable

# Dock
## 清空 Dock
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

## add Launchpad Application to Dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Launchpad.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Safari.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Evernote.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Notion.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

## Dock 放到左側
defaults write com.apple.dock orientation -string "left"
## 自動隱藏 Dock
defaults write com.apple.dock autohide -bool true
## 不需要顯示最近使用過的應用程式
defaults write com.apple.dock show-recents -bool false

# Trackpad
## 開啟觸控板輕觸點擊功能（但目前沒辦法改到系統的介面設定值）
### For Laptop's Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
### For Magic Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Enable tap at login as well
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 關閉滑鼠自然捲動方向
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false


# Finder
## 顯示 Finder 狀態列
defaults write com.apple.finder ShowStatusBar -bool true
## 顯示 Finder 路徑列
defaults write com.apple.finder ShowPathbar -bool true
## 預設目錄為家目錄
defaults write com.apple.finder NewWindowTarget -string "PfLo"
## 預設目錄為家目錄
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
## 預設使用列表模式
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# 顯示副檔名
defaults write -g AppleShowAllExtensions -bool true
# 不在網路的 Volumes 上產生 .DS_Store 檔案
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# 不在 USB 的 Volumes 上產生 .DS_Store 檔案
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Power Management
## 選單列中的電量顯示百分比
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

if ! (pmset -g custom | grep -q "displaysleep"); then
    ## 使用電池時，閒置後關閉顯示器的等待時間，單位：分
    sudo pmset -b displaysleep  5
    ## 使用外接電源時，閒置後關閉顯示器的等待時間
    sudo pmset -c displaysleep  15
fi

# Volume
## 在選單列中顯示音量
defaults write com.apple.systemuiserver menuExtras -array-add \
    "/System/Library/CoreServices/Menu Extras/Volume.menu"
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true



