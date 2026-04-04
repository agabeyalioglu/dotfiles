#!/usr/bin/env zsh

# Make vim the default editor.
export EDITOR='vim';

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# History
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL='ignoreboth'
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# Man pages with syntax highlighting via bat
export MANPAGER="sh -c ‘col -bx | bat -l man -p’";

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# Hide the “default interactive shell is now zsh” warning on macOS.
export BASH_SILENCE_DEPRECATION_WARNING=1;

# For compilers to find zlib you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/curl/include"

#For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:/opt/homebrew/opt/curl/lib/pkgconfig"

# FZF — use fd as backend, bat/eza for previews
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --height=80%
  --layout=reverse
  --border
  --info=inline
  --marker='*'
  --bind='ctrl-/:toggle-preview'
"
export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:300 {}'
  --preview-window=right:60%
"
export FZF_ALT_C_OPTS="
  --preview 'eza --tree --color=always --icons --level=2 {}'
"

# ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"
