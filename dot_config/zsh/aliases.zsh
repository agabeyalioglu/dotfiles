#!/usr/bin/env zsh

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

# Directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias p="cd ~/Projects"
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Shortcuts
alias c="clear"
alias g="git"
alias reload="exec ${SHELL} -l"
alias path='echo -e ${PATH//:/\\n}'
alias week='date +%V'
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# ls → eza
alias ls="eza --icons"
alias ll="eza -alh --git --group-directories-first --icons"
alias l="eza -lh --icons"
alias la="eza -a --icons"
alias lsd="eza -D --icons"
alias lt="eza --tree --level=2 --icons --git-ignore"

# grep → ripgrep
alias grep='rg'

# vim → neovim
alias vim="nvim"

# cat → bat
alias cat="bat"

# du → dust
alias du="dust"

# top → btop
alias top="btop"

# lazygit / lazydocker / tmuxinator
alias lg="lazygit"
alias lzd="lazydocker"
alias mux="tmuxinator"
alias commence="tmuxinator start commence"

# sed → sd
alias sed='sd'

# curl → xh
alias http='xh'
alias https='xh --https'

# ps → procs
alias ps='procs'

# sudo-aware aliases
alias sudo='sudo '

# DNS
alias flush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Network
alias telnet="nc"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# macOS
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias plistbuddy="/usr/libexec/PlistBuddy"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# Fallbacks for systems missing GNU utils
command -v hd > /dev/null || alias hd="hexdump -C"
command -v md5sum > /dev/null || alias md5sum="md5"
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Utilities
alias map="xargs -n1"
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]))"'
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# Updates (brew + npm + gems)
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Git
alias gcand!="gcan! --date=now"
