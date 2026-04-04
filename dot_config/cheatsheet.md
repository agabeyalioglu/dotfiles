# Development Cheatsheet

## Workspace

```
commence                    Start full dev workspace (tmux)
tmuxinator stop commence    Stop workspace
tmux a                      Reattach to detached session
```

### tmux Windows (Ctrl-A + number)

| Key | Window |
|-----|--------|
| 1   | Claude sessions |
| 2   | Code (nvim + file tree) |
| 3   | Services (app + gateway + worker) |
| 4   | Docker (lazydocker) |
| 5   | Git - Commence-Assist (lazygit) |
| 6   | Git - Gateway (lazygit) |

### tmux Controls

| Key | Action |
|-----|--------|
| Ctrl-A d | Detach (session stays alive) |
| Ctrl-A c | New window |
| Ctrl-A w | List windows |
| Ctrl-A \| | Split right |
| Ctrl-A - | Split down |
| Ctrl-A h/j/k/l | Move between panes |
| Ctrl-A H/J/K/L | Resize pane |
| Ctrl-A [ | Scroll mode (vim keys, q to exit) |
| Ctrl-A r | Reload config |
| Ctrl-A I | Install tmux plugins |
| Ctrl-A Ctrl-s | Save session (resurrect) |
| Ctrl-A Ctrl-r | Restore session (resurrect) |
| Ctrl-A :kill-session | Kill everything |

---

## Terminal

### Navigation

```
z <partial>                 Smart cd (zoxide, fuzzy match)
..  ...  ....               Go up 1, 2, 3 levels
p                           cd ~/Projects
dl / dt / doc               cd Downloads / Desktop / Documents
```

### File Search

| Key | Action |
|-----|--------|
| Ctrl-T | Fuzzy find files (bat preview) |
| Ctrl-R | Fuzzy command history |
| Alt-C | Fuzzy cd into directory (tree preview) |
| Ctrl-/ | Toggle preview in fzf |

### fzf-git (Ctrl-G prefix)

| Key | Action |
|-----|--------|
| Ctrl-G Ctrl-B | Browse git branches |
| Ctrl-G Ctrl-H | Browse git commits |
| Ctrl-G Ctrl-T | Browse git tags |
| Ctrl-G Ctrl-S | Browse git stashes |
| Ctrl-G Ctrl-R | Browse git remotes |

### Modern CLI Tools

| Command | Replaces | Example |
|---------|----------|---------|
| rg | grep | `rg "pattern" --type py` |
| fd | find | `fd "name" --type f` |
| bat | cat | `bat file.py` |
| eza | ls | `ll` (detailed), `lt` (tree), `la` (all) |
| sd | sed | `sd 'old' 'new' file.txt` |
| dust | du | `dust` (visual disk usage) |
| procs | ps | `ps python` (keyword search) |
| btop | top | `top` (system monitor) |
| xh | curl | `http GET api.com/users` |

### Aliases

```
lg                          lazygit
lzd                         lazydocker
lt                          tree view (eza)
ll                          detailed file list
c                           clear
reload                      reload shell
path                        print PATH entries
```

### Shell Functions

```
pci                         Init pre-commit in current repo
mkd <dir>                   mkdir + cd into it
port <number>               Find what's using a port
server                      Start HTTP server (python)
extract <file>              Extract any archive
```

### direnv

```
echo 'dotenv' > .envrc      Load .env via direnv
echo 'use mise' > .envrc    Activate mise runtimes
direnv allow                Trust current .envrc
direnv deny                 Untrust
```

---

## Git

### Quick Commands (aliases)

| Alias | Command |
|-------|---------|
| gst | git status |
| gss | git status --short |
| ga | git add |
| gaa | git add --all |
| gcmsg "msg" | git commit --message |
| gcam "msg" | git commit --all --message |
| gc! | git commit --amend |
| gco | git checkout |
| gcb <branch> | git checkout -b |
| gcm | git checkout main |
| gd | git diff |
| gds | git diff --staged |
| gp | git push |
| gpf | git push --force-with-lease |
| gpsup | git push --set-upstream origin (current) |
| gl | git pull |
| gpr | git pull --rebase |
| glog | git log --graph --oneline |
| glol | git log --graph --pretty (detailed) |
| gsta | git stash push |
| gstp | git stash pop |
| gstl | git stash list |
| grb | git rebase |
| grbm | git rebase main |
| grbc | git rebase --continue |
| gm | git merge |
| gf | git fetch |
| gfa | git fetch --all --prune |
| gb | git branch |
| gbd | git branch --delete |
| gbD | git branch --delete --force |
| gbl | git blame -w |

### Git Config Features

- `pull.rebase = true` — pull always rebases
- `rebase.autoStash = true` — auto stash before rebase
- `fetch.prune = true` — auto prune on fetch
- `help.autocorrect = 15` — auto-correct typos (1.5s delay)
- `gh:user/repo` — shorthand for GitHub SSH URLs
- `git whoami` — show current email
- `git fc "text"` — find commits by code change
- `git fm "text"` — find commits by message

---

## Neovim (vim)

### General

| Key | Action |
|-----|--------|
| Space | Leader key |
| jk | Exit insert mode |
| Space w | Save |
| Space q | Quit |
| Esc | Clear search highlight |
| u | Undo |
| Ctrl-r | Redo |

### File Navigation

| Key | Action |
|-----|--------|
| Space ff | Find files (telescope) |
| Space fg | Live grep across project |
| Space fb | Switch buffer |
| Space fo | Recent files |
| Space fw | Grep word under cursor |
| Space n | Toggle file tree (neo-tree) |
| Shift-H | Previous buffer |
| Shift-L | Next buffer |
| Space bd | Close buffer |

### Code Intelligence (LSP)

| Key | Action |
|-----|--------|
| gd | Peek definition (inline) |
| gD | Go to definition |
| gr | Find references |
| gi | Go to implementation |
| K | Hover documentation |
| Space rn | Rename symbol |
| Space ca | Code action (lightbulb) |
| Space D | Type definition |
| Space o | Symbol outline sidebar |
| Space cf | Format file |
| [d / ]d | Prev/next diagnostic |
| Space e | Show diagnostic float |
| Space xx | Diagnostics panel (trouble) |
| Space xd | Buffer diagnostics only |

### Git (in neovim)

| Key | Action |
|-----|--------|
| ]h / [h | Next/prev hunk |
| Space hp | Preview hunk |
| Space hr | Reset hunk |
| Space hb | Blame line |
| Space gs | Git status (telescope) |
| Space gc | Git commits (telescope) |

### Editing

| Key | Action |
|-----|--------|
| gc | Toggle comment (line or selection) |
| gb | Toggle block comment |
| s | Flash jump (type 2 chars) |
| S | Flash treesitter select |
| Ctrl-space | Expand selection (treesitter) |
| Backspace | Shrink selection (treesitter) |
| J (visual) | Move lines down |
| K (visual) | Move lines up |
| ys{motion}{char} | Add surround (e.g. ysiw" ) |
| ds{char} | Delete surround |
| cs{old}{new} | Change surround |

### Windows & Splits

| Key | Action |
|-----|--------|
| Ctrl-h/j/k/l | Move between splits |
| Ctrl-Up/Down | Resize horizontal |
| Ctrl-Left/Right | Resize vertical |
| :vs | Vertical split |
| :sp | Horizontal split |

### Terminal

| Key | Action |
|-----|--------|
| Ctrl-\ | Toggle terminal |
| Space tf | Floating terminal |
| Space th | Horizontal terminal |

### Completion (in insert mode)

| Key | Action |
|-----|--------|
| Tab / Shift-Tab | Navigate completion items |
| Ctrl-n / Ctrl-p | Next/prev item |
| Enter | Confirm selection |
| Ctrl-Space | Trigger completion |
| Ctrl-d / Ctrl-f | Scroll docs |

### Dashboard (start screen)

| Key | Action |
|-----|--------|
| f | Find file |
| r | Recent files |
| g | Find text |
| e | File tree |
| q | Quit |

---

## Docker

```
lzd                         lazydocker TUI
docker compose up --build   Start services
docker compose down         Stop services
docker compose logs -f      Tail logs
docker system prune -a      Clean everything
```

### lazydocker Keys

| Key | Action |
|-----|--------|
| hjkl | Navigate |
| Enter | Select |
| d | Remove |
| s | Stop |
| r | Restart |
| l | Logs |
| [ / ] | Switch panels |
| q | Quit |

---

## lazygit Keys

| Key | Action |
|-----|--------|
| Space | Stage/unstage file |
| a | Stage all |
| c | Commit |
| P | Push |
| p | Pull |
| b | Branches panel |
| s | Stash |
| S | Stash pop |
| / | Filter |
| ? | Help |
| q | Quit |

---

## Housekeeping

```
make clean                  Clear caches (run in dotfiles repo)
chezmoi update              Pull latest dotfiles + apply
chezmoi diff                Preview pending changes
chezmoi apply               Apply dotfiles
```

---

## Key Ports

| Service | Port |
|---------|------|
| Frontend (Next.js) | 3001 |
| Backend (FastAPI) | 3000 |
| Gateway | 8001 |
