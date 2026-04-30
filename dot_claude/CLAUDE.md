### Workflow

- Plan mode for features, multi-step work, or anything touching 3+ files. If it goes sideways, STOP and re-plan.
- Bug reports and failing tests: fix directly. No plan mode needed. Point at evidence, resolve it.
- Use subagents for research, exploration, and parallel work. One task per subagent. Keep main context clean.
- After ANY correction (user, code review, failing test), add to the relevant CLAUDE.md pitfalls section immediately.

### TDD (Mandatory)

- **Always TDD**: Write failing test first (red), minimal implementation to pass (green), refactor. No exceptions.
- **Vertical slices**: One test → one implementation → repeat. NEVER write all tests first then all code (horizontal slicing).
- **Test behavior, not implementation**: Tests use public interfaces only. If a test breaks on refactor but behavior hasn't changed, it's a bad test.
- **Mock only at system boundaries**: External APIs, databases, time/randomness. Never mock your own modules or internal collaborators.
- **When briefing subagents**: Explicitly instruct them to write tests FIRST, verify they fail, THEN implement. Include this in every agent prompt.
- **Reference**: Full TDD methodology lives in `/tdd` skill. Use `/feature-dev` for feature work (has TDD built into Phase 5).

### Verification

- Never mark a task complete without proving it works.
- For non-trivial changes: pause and ask "is there a more elegant way?" Skip this for obvious fixes.
- After completing non-trivial features (3+ files changed), run `/deep-review` before merging.

### Tooling

- **Runtimes**: `mise` (not nvm/pyenv/rbenv). **Python packages**: `uv` (not pip).
- **Dotfiles**: managed by chezmoi. Edit source at `~/.local/share/chezmoi/`, not `~/` directly.
- **Docker**: runs via colima (not Docker Desktop). `colima start` before docker commands.
- **CLI replacements**: bat(cat), rg(grep), sd(sed), fd(find), procs(ps), eza(ls), dust(du), btop(top), xh(curl), delta(diff).
- **direnv** is active. Use `.envrc` for project env vars. Prefer over manual `source .env`.
- **Git**: pull rebases by default, autoStash enabled. Use `gh` for GitHub ops. `pci` to init pre-commit in any repo.

### Frontend (all projects)

- Server Components by default — only add `"use client"` when the component needs hooks, state, or browser APIs.

### Personal vault (~/vault)

I maintain a personal productivity vault at `~/vault`. You have access to it via the `obsidian-vault` MCP server (filesystem-backed, always available) from any Claude Code session.

- **Files:** `commitments/*.md` (one per stakeholder, source of truth for what I owe), `daily/YYYY-MM-DD.md` (daily notes), `_meta/hot-cache.md` (short-term memory, rewritten on `/eod`), `inbox/` (unsorted captures), `projects/`, `someday/`.
- **SessionStart hook** injects `_meta/hot-cache.md` — you already know overdue items and open threads at session start.
- **Slash commands:** `/morning` (briefing + inbox triage) and `/eod` (sweep + hot-cache rewrite). Both at `~/.claude/commands/`.
- **Full conventions:** `~/vault/CLAUDE.md` — read it before writing to the vault.
- **Rules:** never delete commitments without asking; never invent commitments; dates always absolute (YYYY-MM-DD); `/eod` is the only place that rewrites `_meta/hot-cache.md`.
- **Context etiquette:** in non-vault sessions (coding work etc.), acknowledge vault context exists but don't act on it unless I say so.

@RTK.md


