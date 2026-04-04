# dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's included

### Shell (zsh)

- [Starship](https://starship.rs/) prompt with git status, language versions, and command duration
- Plugins: autosuggestions, syntax highlighting, history substring search, you-should-use
- [fzf](https://github.com/junegunn/fzf) with [fd](https://github.com/sharkdp/fd) backend and bat/eza previews
- [zoxide](https://github.com/ajeetdsouza/zoxide) for smart directory jumping
- [mise](https://mise.jdx.dev/) for runtime version management (Node, Ruby, Java)
- Optimized startup: hardcoded Homebrew paths, cached compinit, PATH deduplication

### Modern CLI replacements

| Classic | Replacement |
|---------|-------------|
| `cat` | [bat](https://github.com/sharkdp/bat) |
| `ls` | [eza](https://github.com/eza-community/eza) |
| `grep` | [ripgrep](https://github.com/BurntSushi/ripgrep) |
| `find` | [fd](https://github.com/sharkdp/fd) |
| `du` | [dust](https://github.com/bootandy/dust) |
| `top` | [btop](https://github.com/aristocratos/btop) |
| `diff` | [delta](https://github.com/dandavella/delta) |

### Git

- Delta as pager with side-by-side diffs, syntax highlighting, and hyperlinks
- Pull defaults to rebase with auto-stash
- Fetch auto-prunes deleted remote branches
- Data integrity checks on transfer
- Mistyped command autocorrect
- URL shorthands (`gh:user/repo`)
- Extensive aliases (oh-my-zsh git plugin)

### Terminal ([Ghostty](https://ghostty.org/))

- Ayu Dark color scheme with Hack Nerd Font
- `Cmd+D` / `Cmd+Shift+D` for horizontal/vertical splits
- Notifications when background commands finish
- Clipboard paste protection and trailing space trimming
- Quick terminal toggle with `` Cmd+` ``

### tmux

- `Ctrl+A` prefix
- Vim-style pane navigation and resizing
- Mouse support, vi copy mode
- True color support
- Activity monitoring

### Tools config

- **bat** — gruvbox theme, line numbers, syntax mappings
- **ripgrep** — smart-case, hidden files, column limit
- **fd** — global ignore patterns (node_modules, .venv, build, etc.)
- **pre-commit** — default config with trailing whitespace, merge conflict, and secret detection hooks

### macOS defaults

Auto-applied `run_onchange_` script that sets:

- Fast key repeat, disabled press-and-hold
- No smart quotes, dashes, autocorrect, or auto-capitalization
- Finder: path bar, status bar, POSIX title, folders first, no .DS_Store on network/USB
- Dock: instant autohide, no recent apps
- Expanded save/print dialogs, save to disk by default
- Screenshots: no shadow, PNG format

### Brewfile

Auto-runs `brew bundle` via chezmoi when the Brewfile changes. Includes CLI tools, casks, VS Code extensions, and uv packages.

## Install

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install chezmoi and apply dotfiles
brew install chezmoi
chezmoi init --apply agabeyalioglu
```

## Usage

```bash
# Edit dotfiles
chezmoi edit ~/.zshrc

# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Pull latest and apply
chezmoi update

# Init pre-commit in a project
pci
```

## License

[MIT](LICENSE)
