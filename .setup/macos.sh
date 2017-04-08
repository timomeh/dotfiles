#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



### Misc ###########################################################
echo "  => Misc Settings"

# Locales
echo "      - Setting Locales"
defaults write NSGlobalDomain AppleLocale -string "de_DE"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# 24-Hour Time
echo "      - 24 Hour Clock"
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

echo "      - Flurry Screen Saver"
# Screen Saver: Flurry
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Flurry" path -string "/System/Library/Screen Savers/Flurry.saver" type -int 0

echo "      - Faster Window Resize Time"
# Faster window resize time
defaults write -g NSWindowResizeTime -float 0.07


echo ""
### Finder #############################################################
echo "  => Finder"

echo "      - Show ~/Library"
# Show ~/Library dir
chflags nohidden ~/Library

echo "      - Expand save panel by default"
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "      - Disable the “Are you sure you want to open this application?” dialog"
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "      - Show filename extensions"
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "      - Hide status bar"
# Finder: hide status bar
defaults write com.apple.finder ShowStatusBar -bool false

echo "      - Show path bar"
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

echo "      - Search in current directory by default"
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "      - No warning when changing file extension"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "      - No .DS_Store for network drives"
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "      - No .DS_Store for USB drives"
# Avoid creating .DS_Store files on USB Drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "      - Default to list view"
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


echo ""
### Keyboard #########################################################
echo "  => Keyboard"

echo "      - Full keyboard access in windows/modals"
# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "      - Disable auto correct"
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "      - Disable smart quotes and dashes"
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


echo ""
### Dock ##############################################################
echo "  => Dock"

echo "      - Minimize app to app icon"
# Minimize to application icon
defaults write com.apple.dock minimize-to-application -bool true

echo "      - Default size of 36px"
# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

echo "      - Scale effect for minimizing"
# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

echo "      - Show indicator lights"
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

echo "      - Auto hide/show"
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

echo "      - No auto-hide delay"
# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

echo "      - Fast hide/show animation"
# Set fast animation speed when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.3

echo "      - Highlight for grid view of stack"
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilte-stack -bool true

echo "      - Spring Loading on dock items"
# Enable spring loading for all Dock items"
defaults write enable-spring-load-actions-on-all-items -bool true

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'


echo ""
### Safari ############################################################
echo "  => Safari"

echo "      - Show full URL"
# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

echo "      - Don't open downloads automatically"
# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


echo ""
### Time Machine #######################################################
echo "  => Time Machine"

echo "      - Don't ask for every hard drive"
# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


echo ""
### Activity Monitor ####################################################
echo "  => Activity Monitor"

echo "      - Open with main window"
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

echo "      - Show CPU usage as Dock Icon"
# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

echo "      - Show all processes"
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo "      - Sort by CPU usage"
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0


echo ""
### App Store ###########################################################
echo "  => App Store"

echo "      - Check for updates daily"
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "      - Download new updates in background"
# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "      - Auto-install system updates"
# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

echo "      - Auto-install app updates"
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true


echo ""
### Kill Apps ############################################################
echo "  => Killing affected apps..."

for app in "Activity Monitor" "Dock" "Finder"; do
	killall "${app}" &> /dev/null
done