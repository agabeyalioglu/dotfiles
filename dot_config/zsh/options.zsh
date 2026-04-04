stty -ixon

# Navigation
setopt AUTO_CD              # type directory name without cd
setopt AUTO_PUSHD           # push dirs onto stack, enables cd -1, cd -2
setopt PUSHD_IGNORE_DUPS    # no duplicate dirs in stack

# Correction
setopt CORRECT              # suggest corrections for mistyped commands

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}=A-Z'  # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
