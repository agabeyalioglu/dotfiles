stty -ixon

# Navigation
setopt AUTO_CD              # type directory name without cd
setopt AUTO_PUSHD           # push dirs onto stack, enables cd -1, cd -2
setopt PUSHD_IGNORE_DUPS    # no duplicate dirs in stack
setopt PUSHD_SILENT         # suppress dir stack printout

# History
setopt EXTENDED_HISTORY         # record timestamp and duration
setopt HIST_IGNORE_SPACE        # commands starting with space are not saved
setopt HIST_EXPIRE_DUPS_FIRST   # trim duplicates first when history is full
setopt HIST_REDUCE_BLANKS       # strip extra whitespace
setopt HIST_VERIFY              # show expanded history before executing

# Globbing
setopt EXTENDED_GLOB        # enable #, ~, ^ in glob patterns
setopt GLOB_DOTS            # match dotfiles without explicit dot

# Correction
setopt CORRECT              # suggest corrections for mistyped commands

# Completion
setopt ALWAYS_TO_END        # move cursor to end after completion
setopt COMPLETE_IN_WORD     # allow completion from middle of word
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}=A-Z'  # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Job control
setopt NOTIFY               # report background job status immediately

# Deduplicate PATH entries
typeset -U path
