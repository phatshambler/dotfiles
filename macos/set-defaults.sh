#!/usr/bin/env bash

# macOS defaults, for recent macOS versions (Sonoma and later).
# Inspired by https://mths.be/macos and https://macos-defaults.com
#
# Run it with `set-defaults` (or `dot`). Settings that only make sense for
# developers are applied on machines with the `dev` role.

# Close any open System Settings panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Settings" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Roles of this machine: has_role
. "$(dirname "$0")/../script/roles.sh"

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the startup chime
sudo nvram StartupMute=%01

# Only show scrollbars when scrolling (personal)
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Disable the animations when opening and closing windows
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

if has_role dev
then
  # Disable automatic capitalization, smart dashes, period substitution,
  # smart quotes and auto-correct, as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

###############################################################################
# Trackpad, keyboard and input                                                #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Keyboard navigation: move focus between all controls with Tab
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

if has_role dev
then
  # Fastest key repeat available in System Settings
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
fi

# Press-and-hold for accented letters (é, à, ç…) is left on, on purpose.

###############################################################################
# Screenshots                                                                 #
###############################################################################

# Save screenshots to ~/Pictures/Screenshots instead of the desktop
mkdir -p "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in window screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Disable window and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Open new Finder windows in the home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show external drives, servers and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar and path bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name, in windows and on the desktop
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Remove items from the Trash after 30 days, without warning when emptying it
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Hide recent tags in the sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Spring loading for directories, without delay
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand the “General”, “Open with” and “Sharing & Permissions” Get Info panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

if has_role dev
then
  # Show hidden files and the full POSIX path in the window title
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # Show the ~/Library and /Volumes folders
  chflags nohidden ~/Library
  sudo chflags nohidden /Volumes
fi

###############################################################################
# Dock, Mission Control and windows                                           #
###############################################################################

# Set the icon size of Dock items to 48 pixels (personal: keep my own size)
# defaults write com.apple.dock tilesize -int 48

# Minimize windows with the scale effect (not the genie) into their
# application’s icon
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true

# Don’t show recent applications in the Dock
defaults write com.apple.dock show-recents -bool false

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock, without delay (personal: always shown)
# defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock autohide-delay -float 0
# defaults write com.apple.dock autohide-time-modifier -float 0.2

# Highlight hover effect and spring loading in Dock stacks
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
defaults write com.apple.dock expose-group-apps -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Clicking the wallpaper only reveals the desktop in Stage Manager
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# No margins between tiled windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

# Hot corners (personal: all disabled)
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# 14: Quick Note
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Lock Screen
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

# Add iOS Simulator to Launchpad (devs with Xcode only)
if has_role dev && [ -d /Applications/Xcode.app ]
then
  sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
fi

###############################################################################
# Terminal                                                                    #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes, sorted by CPU usage
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# TextEdit and QuickTime                                                      #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

###############################################################################
# Software updates                                                            #
###############################################################################

# Check for, download and install security updates and system data files
# (XProtect, etc.) automatically. These live in the system-wide preferences.
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true

# Keep App Store apps up to date
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Google Chrome                                                               #
###############################################################################

# Disable the all too sensitive backswipe on trackpads and Magic Mouse
# (personal: swipe navigation kept)
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false

###############################################################################
# Restart affected apps                                                       #
###############################################################################

for app in "cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
