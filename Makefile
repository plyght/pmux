.PHONY: setup dev release staging clean help

TAG ?= dev

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

setup: ## First-time setup (submodules + GhosttyKit)
	./scripts/setup.sh

dev: ## Build and launch debug app (TAG=name, default: dev)
	./scripts/reload.sh --tag $(TAG) -q

release: ## Build and launch release app
	./scripts/reloadp.sh

staging: ## Build and launch staging app (isolated from production)
	./scripts/reloads.sh

clean: ## Remove DerivedData and build artifacts for a tag
	@echo "Cleaning tag: $(TAG)"
	-pkill -f "cmux DEV $(TAG).app/Contents/MacOS/cmux DEV" 2>/dev/null || true
	rm -rf "$(HOME)/Library/Developer/Xcode/DerivedData/cmux-$(TAG)"
	rm -rf "/tmp/cmux-$(TAG)"
	rm -f "/tmp/cmux-debug-$(TAG).sock"
	rm -f "/tmp/cmux-debug-$(TAG).log"
	rm -f "$(HOME)/Library/Application Support/cmux/cmuxd-dev-$(TAG).sock"

clean-all: ## Remove ALL cmux DerivedData (all tags)
	@echo "Cleaning all cmux DerivedData..."
	-pkill -f "cmux DEV" 2>/dev/null || true
	rm -rf $(HOME)/Library/Developer/Xcode/DerivedData/cmux-*
	rm -rf /tmp/cmux-*
	rm -f /tmp/cmux-debug-*.sock
	rm -f /tmp/cmux-debug-*.log
