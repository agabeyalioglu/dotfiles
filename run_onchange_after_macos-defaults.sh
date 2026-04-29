#!/bin/bash
# macOS defaults — re-runs when this script changes
# hash: {{ include "run_onchange_after_macos-defaults.sh" | sha256sum }}

set -e

echo "Applying macOS defaults..."

# --- Keyboard ---
# Disable press-and-hold for keys (enable key repeat)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Fastest key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
# Delay before repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 20
# Full keyboard access for all UI controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# --- Disable smart substitutions ---
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# --- Finder ---
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# --- Dock ---
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1

# --- Window management ---
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# --- Locale ---
defaults write -g AppleLocale -string "en_US"

# --- Input sources: US (default), Turkish-QWERTY, Japanese (Kotoeri) ---
defaults write com.apple.HIToolbox AppleEnabledInputSources -array \
    '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 0; "KeyboardLayout Name" = "U.S."; }' \
    '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = -36; "KeyboardLayout Name" = "Turkish-QWERTY-PC"; }' \
    '{ "Bundle ID" = "com.apple.inputmethod.Kotoeri"; "Input Mode" = "com.apple.inputmethod.Japanese"; InputSourceKind = "Input Mode"; }' \
    '{ "Bundle ID" = "com.apple.PressAndHold"; InputSourceKind = "Non Keyboard Input Method"; }' \
    '{ "Bundle ID" = "com.apple.CharacterPaletteIM"; InputSourceKind = "Non Keyboard Input Method"; }'

# Default to US on first login
defaults write com.apple.HIToolbox AppleSelectedInputSources -array \
    '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 0; "KeyboardLayout Name" = "U.S."; }'

# --- Mouse (Magic Mouse, wired/Bluetooth) ---
for domain in com.apple.AppleMultitouchMouse com.apple.driver.AppleBluetoothMultitouch.mouse; do
    defaults write "$domain" MouseButtonMode -string "TwoButton"
    defaults write "$domain" MouseButtonDivision -int 55
    defaults write "$domain" MouseHorizontalScroll -int 1
    defaults write "$domain" MouseVerticalScroll -int 1
    defaults write "$domain" MouseMomentumScroll -int 1
    defaults write "$domain" MouseOneFingerDoubleTapGesture -int 1
    defaults write "$domain" MouseTwoFingerDoubleTapGesture -int 3
    defaults write "$domain" MouseTwoFingerHorizSwipeGesture -int 2
done

# --- Trackpad (built-in + Magic Trackpad) ---
for domain in com.apple.AppleMultitouchTrackpad com.apple.driver.AppleBluetoothMultitouch.trackpad; do
    defaults write "$domain" Clicking -int 0
    defaults write "$domain" Dragging -int 0
    defaults write "$domain" DragLock -int 0
    defaults write "$domain" TrackpadHandResting -int 1
    defaults write "$domain" TrackpadScroll -int 1
    defaults write "$domain" TrackpadHorizScroll -int 1
    defaults write "$domain" TrackpadMomentumScroll -int 1
    defaults write "$domain" TrackpadPinch -int 1
    defaults write "$domain" TrackpadRotate -int 1
    defaults write "$domain" TrackpadRightClick -int 1
    defaults write "$domain" TrackpadCornerSecondaryClick -int 0
    defaults write "$domain" TrackpadThreeFingerDrag -int 0
    defaults write "$domain" TrackpadThreeFingerTapGesture -int 0
    defaults write "$domain" TrackpadThreeFingerHorizSwipeGesture -int 2
    defaults write "$domain" TrackpadThreeFingerVertSwipeGesture -int 2
    defaults write "$domain" TrackpadFourFingerHorizSwipeGesture -int 2
    defaults write "$domain" TrackpadFourFingerVertSwipeGesture -int 2
    defaults write "$domain" TrackpadFourFingerPinchGesture -int 2
    defaults write "$domain" TrackpadFiveFingerPinchGesture -int 2
    defaults write "$domain" TrackpadTwoFingerDoubleTapGesture -int 1
    defaults write "$domain" TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
    defaults write "$domain" USBMouseStopsTrackpad -int 0
done

# Built-in trackpad-only (Force Touch detents, click thresholds)
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 1
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -int 0

# Force Click (global)
defaults write -g com.apple.trackpad.forceClick -bool true

# --- Screenshots ---
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"

# --- Security ---
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Restart affected apps
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo "macOS defaults applied."
