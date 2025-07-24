defaults write com.apple.controlcenter "BatteryShowPercentage" -bool true
defaults write com.apple.controlcenter "Bluetooth" -int 18
defaults write com.apple.controlcenter "Sound" -int 18

defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

defaults write com.apple.TextInputMenu visible -bool false

defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true

# Dock position
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "32"

# Dock autohide
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.2"
defaults write com.apple.dock "autohide-delay" -float "0"

# Don't show recent apps in dock
defaults write com.apple.dock "show-recents" -bool "false"

# Scroll up on an app in the dock to reveal all windows
defaults write com.apple.dock "scroll-to-open" -bool "true"

killall Dock

# Show extensions in Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Expand save panel
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Show hidden files in Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"


# Finder view
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" # column view
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" # folders first
defaults write com.apple.finder "FinderSpawnTab" -bool "false" # don't use tabs with cmd-click
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # search in current dir
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" # don't warn when changing an extension
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" # instant rollover in finder toolbar
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2" # finder sidebar icon size

defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

defaults write com.apple.finder "CreateDesktop" -bool "true" # show icons on desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"

killall Finder

# Mouse
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1" # speed
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton" # magic mouse should behave like two button mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

# Keyboard
defaults write com.apple.HIToolbox AppleFnUsageType -int "0" # do nothing when Fn or 🌐︎ key is held

# Mission control
defaults write com.apple.dock "mru-spaces" -bool "false" # don't rearrange spaces automatically

defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false" # deactivate apple intelligence