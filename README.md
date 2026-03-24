<h1 align="center">pmux</h1>
<p align="center"><strong>Plyght’s multiplexer</strong> — a personal fork of <a href="https://github.com/manaflow-ai/cmux">cmux</a></p>

<p align="center">Ghostty-based macOS terminal with vertical tabs, agent notifications, and an in-app browser</p>

<p align="center">
  <img src="./docs/assets/main-first-image.png" alt="Screenshot" width="900" />
</p>

## About this fork

**pmux** is Plyght’s build of the cmux codebase: same core ideas (native Swift/AppKit shell around libghostty, workspaces, splits, scripting), maintained separately for now. Upstream releases, docs, and community channels still live with [manaflow-ai/cmux](https://github.com/manaflow-ai/cmux).

## Features

- **Notification rings** — Panes and tabs surface when coding agents need attention
- **Notification panel** — One place for pending notifications; jump to the latest unread
- **In-app browser** — Split a browser beside the terminal; scriptable API inspired by [agent-browser](https://github.com/vercel-labs/agent-browser)
- **Vertical + horizontal tabs** — Sidebar shows git branch, PR status, cwd, listening ports, and recent notification text
- **Scriptable** — CLI and socket API for workspaces, splits, keys, and browser automation
- **Native macOS** — Swift/AppKit, not Electron
- **Ghostty config** — Reads `~/.config/ghostty/config` for themes, fonts, and colors
- **GPU-accelerated** — libghostty rendering

## Build (this repo)

1. Run `./scripts/setup.sh` (submodules + GhosttyKit).
2. Open `GhosttyTabs.xcodeproj` in Xcode and build the **cmux** scheme, or use `./scripts/reload.sh --tag <name>` for an isolated debug app (see `AGENTS.md`).

Installers, Sparkle, and Homebrew in upstream README apply to **cmux** releases, not necessarily this fork.

## Documentation

Upstream docs: [cmux.com/docs](https://cmux.com/docs/getting-started). CLI/socket behavior is largely shared; names in your tree may still say `cmux` until renamed.

## Keyboard shortcuts

### Workspaces

| Shortcut | Action |
|----------|--------|
| ⌘ N | New workspace |
| ⌘ 1–8 | Jump to workspace 1–8 |
| ⌘ 9 | Jump to last workspace |
| ⌃ ⌘ ] | Next workspace |
| ⌃ ⌘ [ | Previous workspace |
| ⌘ ⇧ W | Close workspace |
| ⌘ ⇧ R | Rename workspace |
| ⌘ B | Toggle sidebar |

### Surfaces

| Shortcut | Action |
|----------|--------|
| ⌘ T | New surface |
| ⌘ ⇧ ] | Next surface |
| ⌘ ⇧ [ | Previous surface |
| ⌃ Tab | Next surface |
| ⌃ ⇧ Tab | Previous surface |
| ⌃ 1–8 | Jump to surface 1–8 |
| ⌃ 9 | Jump to last surface |
| ⌘ W | Close surface |

### Split panes

| Shortcut | Action |
|----------|--------|
| ⌘ D | Split right |
| ⌘ ⇧ D | Split down |
| ⌥ ⌘ ← → ↑ ↓ | Focus pane directionally |
| ⌘ ⇧ H | Flash focused panel |

### Browser

Browser developer-tool shortcuts follow Safari defaults and are customizable in **Settings → Keyboard Shortcuts**.

| Shortcut | Action |
|----------|--------|
| ⌘ ⇧ L | Open browser in split |
| ⌘ L | Focus address bar |
| ⌘ [ | Back |
| ⌘ ] | Forward |
| ⌘ R | Reload page |
| ⌥ ⌘ I | Toggle Developer Tools (Safari default) |
| ⌥ ⌘ C | Show JavaScript Console (Safari default) |

### Notifications

| Shortcut | Action |
|----------|--------|
| ⌘ I | Show notifications panel |
| ⌘ ⇧ U | Jump to latest unread |

### Find

| Shortcut | Action |
|----------|--------|
| ⌘ F | Find |
| ⌘ G / ⌘ ⇧ G | Find next / previous |
| ⌘ ⇧ F | Hide find bar |
| ⌘ E | Use selection for find |

### Terminal

| Shortcut | Action |
|----------|--------|
| ⌘ K | Clear scrollback |
| ⌘ C | Copy (with selection) |
| ⌘ V | Paste |
| ⌘ + / ⌘ - | Increase / decrease font size |
| ⌘ 0 | Reset font size |

### Window

| Shortcut | Action |
|----------|--------|
| ⌘ ⇧ N | New window |
| ⌘ , | Settings |
| ⌘ ⇧ , | Reload configuration |
| ⌘ Q | Quit |

## Session restore

On relaunch, the app restores layout and metadata (windows, workspaces, panes, cwd, terminal scrollback where possible, browser URL/history). Live shell processes (e.g. long-running agents inside tmux) are not resumed.

## License

Open source under [AGPL-3.0-or-later](LICENSE), same as upstream cmux.
