#!/bin/bash
# macOS defaults — re-runs when this script changes
# hash: {{ include "run_onchange_after_macos-defaults.sh" | sha256sum }}

set -e

echo "Applying macOS defaults..."

# --- Keyboard ---
# Disable press-and-hold for keys (enable key repeat)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Fastest key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Shortest delay before repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10
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
