# Esc Esc — toggle `sudo` prefix on the current line
sudo-command-line() {
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}
zle -N sudo-command-line
bindkey '\e\e' sudo-command-line

# Ctrl-K — kill the whole line, not just to end-of-line
bindkey '^K' kill-whole-line
