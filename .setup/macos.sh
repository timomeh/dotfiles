#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

# Ask for the administrator password upfront
sudo -v

osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "System: Setting locales"
defaults write NSGlobalDomain AppleLocale -string "de_DE"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

echo "System: Save to disk by default (not iCloud)"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "System: 24 Hour Clock"
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

echo "System: Faster Window Resize Time"
defaults write -g NSWindowResizeTime -float 0.07

echo "System: Quit Printer App once print job completes"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "System: Show system info in clock menu"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "Finder: Show ~/Library"
chflags nohidden ~/Library

echo "Finder: Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "Finder: Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Finder: Show filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder: Hide status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool false

echo "Finder: Show path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder: Search in current directory by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Finder: No warning when changing file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Finder: No .DS_Store for network drives"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Finder: No .DS_Store for USB drives"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Finder: Default to column view"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "System: Save screenshots to ~/Desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

echo "Finder: Show directories on top when sorting by filename"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Keyboard: Full keyboard access in windows/modals"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Keyboard: Disable auto correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Keyboard: Disable smart quotes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Keyboard: Disable smart dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Keyboard: Disable smart periods"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false


echo "Dock: Minimize app to app icon"
defaults write com.apple.dock minimize-to-application -bool true

echo "Dock: Set icon size to 36px"
defaults write com.apple.dock tilesize -int 36

echo "Dock: Scale effect for minimizing"
defaults write com.apple.dock mineffect -string "scale"

echo "Dock: Show indicator lights"
defaults write com.apple.dock show-process-indicators -bool true

echo "Dock: Auto hide/show"
defaults write com.apple.dock autohide -bool true

echo "Dock: No auto-hide delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Dock: Fast hide/show animation"
defaults write com.apple.dock autohide-time-modifier -float 0.3

echo "Dock: Enable highlight hover effect for grid view of stack"
defaults write com.apple.dock mouse-over-hilte-stack -bool true

echo "Dock: Enable spring loading"
defaults write enable-spring-load-actions-on-all-items -bool true

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

echo "TimeMachine: Don't ask for every hard drive"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


echo "Activity Monitor: Show CPU usage as Dock Icon"
defaults write com.apple.ActivityMonitor IconType -int 5

echo "Activity Monitor: Show all processes"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo "Activity Monitor: Sort by CPU usage by default"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

echo ""
echo "Killing affected apps..."

for app in "Activity Monitor" "Dock" "Finder"; do
	killall "${app}" &> /dev/null
done

echo "done."
