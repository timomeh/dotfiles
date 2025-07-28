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
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" # column view
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" # folders first
defaults write com.apple.finder "FinderSpawnTab" -bool "false" # don't use tabs with cmd-click
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # search in current dir
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" # don't warn when changing an extension
defaults write com.apple.finder FXICloudDriveDesktop -bool false
defaults write com.apple.finder FXICloudDriveDocuments -bool false
defaults write com.apple.finder FXICloudDriveEnabled -bool true
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
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write -globalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write -globalDomain NSAutomaticInlinePredictionEnabled -bool false
defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -globalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Mission control
defaults write com.apple.dock "mru-spaces" -bool "false" # don't rearrange spaces automatically

defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false" # deactivate apple intelligence

# Spaces
defaults write com.apple.spaces app-bindings -dict net.whatsapp.whatsapp ''\
                                                       ru.keepcoder.telegram '' \
                                                       com.hnc.discord '' \
                                                       com.mimestream.mimestream ''

# com.superultra.Homerow
defaults write com.superultra.Homerow 'NSStatusItem Visible Item-0' -bool false
defaults write com.superultra.Homerow SUHasLaunchedBefore -bool true
defaults write com.superultra.Homerow activation-count -int 2
defaults write com.superultra.Homerow launch-at-login -bool true
defaults write com.superultra.Homerow show-menubar-icon -bool false

# com.sindresorhus.Menu-Bar-Spacing
defaults write com.sindresorhus.Menu-Bar-Spacing SS_launchCount -int 1
defaults write com.sindresorhus.Menu-Bar-Spacing SUHasLaunchedBefore -bool true

# Shortcut settings (created by plistwatcher)
defaults write "AppleSymbolicHotKeys" "com.apple.symbolichotkeys" '{118={enabled=1;value={parameters=(65535,18,262144,);type=standard;};};119={enabled=1;value={parameters=(65535,19,262144,);type=standard;};};120={enabled=1;value={parameters=(65535,20,262144,);type=standard;};};121={enabled=1;value={parameters=(65535,21,262144,);type=standard;};};122={enabled=1;value={parameters=(65535,23,262144,);type=standard;};};123={enabled=1;value={parameters=(65535,22,262144,);type=standard;};};15={enabled=0;};16={enabled=0;};164={enabled=0;value={parameters=(65535,65535,0,);type=standard;};};17={enabled=0;};175={enabled=0;value={parameters=(65535,65535,0,);type=standard;};};18={enabled=0;};184={enabled=0;value={parameters=(53,23,1179648,);type=standard;};};19={enabled=0;};190={enabled=0;value={parameters=(113,12,8388608,);type=standard;};};20={enabled=0;};21={enabled=0;};22={enabled=0;};222={enabled=0;value={parameters=(65535,65535,0,);type=standard;};};23={enabled=0;};24={enabled=0;};25={enabled=0;};26={enabled=0;};28={enabled=0;value={parameters=(51,20,1179648,);type=standard;};};29={enabled=0;value={parameters=(51,20,1441792,);type=standard;};};30={enabled=0;value={parameters=(52,21,1179648,);type=standard;};};31={enabled=1;value={parameters=(52,21,1441792,);type=standard;};};32={enabled=1;value={parameters=(51,20,1310720,);type=standard;};};33={enabled=0;value={parameters=(65535,125,8650752,);type=standard;};};34={enabled=1;value={parameters=(51,20,1441792,);type=standard;};};36={enabled=0;value={parameters=(65535,103,8388608,);type=standard;};};60={enabled=0;value={parameters=(32,49,262144,);type=standard;};};61={enabled=0;value={parameters=(32,49,786432,);type=standard;};};79={enabled=1;value={parameters=(65535,123,8650752,);type=standard;};};80={enabled=1;value={parameters=(65535,123,8781824,);type=standard;};};81={enabled=1;value={parameters=(65535,124,8650752,);type=standard;};};82={enabled=1;value={parameters=(65535,124,8781824,);type=standard;};};}'