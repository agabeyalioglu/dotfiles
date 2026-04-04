.PHONY: install update edit diff apply clean

install: ## First-time install
	@chezmoi init --apply agabeyalioglu

update: ## Pull latest and apply
	@chezmoi update

edit: ## Open chezmoi source dir
	@cd $$(chezmoi source-path) && $$EDITOR .

diff: ## Show pending changes
	@chezmoi diff

apply: ## Apply dotfiles
	@chezmoi apply

brew: ## Run brew bundle
	@brew bundle --file=~/.Brewfile --no-lock

clean: ## Clean caches (npm, Xcode, Spotify)
	@npm cache clean --force 2>/dev/null || true
	@rm -rf ~/Library/Developer/Xcode/DerivedData
	@xcrun simctl delete unavailable 2>/dev/null || true
	@rm -rf ~/Library/Caches/com.spotify.client
	@echo "Caches cleaned."

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
