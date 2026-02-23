---
name: laptop-setup
description: Bootstrap a fresh macOS laptop. Sets up 1Password SSH, Xcode CLT, Homebrew, dotfiles, and runs the Ansible playbook. Use this skill when the user says they want to set up a new laptop, bootstrap their machine, or run the laptop setup.
allowed-tools: Bash, AskUserQuestion
---

# Fresh macOS Laptop Setup

This skill automates the full setup of a new Mac. Run each step in order, confirming success before proceeding to the next.

## Prerequisites

Before starting, confirm with the user:
1. **1Password** is installed (from App Store) and they have signed in
2. **SSH Agent** is enabled in 1Password (Settings > Developer > SSH Agent)

If not, tell them to do this first and come back.

## Step 1: Verify 1Password SSH Agent

```bash
test -S "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" && echo "OK: 1Password SSH agent is running" || echo "FAIL: SSH agent socket not found"
```

If this fails, stop and tell the user to enable the SSH agent in 1Password.

## Step 2: Configure SSH

Create `~/.ssh/config` to use the 1Password agent (skip if it already exists):

```bash
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
if [ ! -f "$HOME/.ssh/config" ]; then
  cat > "$HOME/.ssh/config" <<'EOF'
Host *
	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
EOF
  chmod 644 "$HOME/.ssh/config"
  echo "Created ~/.ssh/config"
else
  echo "~/.ssh/config already exists, skipping"
fi
```

## Step 3: Xcode Command Line Tools

```bash
if xcode-select -p &>/dev/null; then
  echo "Xcode CLT already installed"
else
  xcode-select --install
fi
```

If `xcode-select --install` was triggered, **wait for the GUI installer to finish** before continuing. Ask the user to confirm when it's done.

## Step 4: Install Homebrew

```bash
if command -v brew &>/dev/null; then
  echo "Homebrew already installed"
else
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
```

## Step 5: Install Ansible

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install ansible 2>/dev/null || true
```

## Step 6: Clone the home-server repo

```bash
mkdir -p "$HOME/code/personal"
if [ ! -d "$HOME/code/personal/home-server" ]; then
  git clone git@github.com:mcgizzle/home-server.git "$HOME/code/personal/home-server"
else
  echo "home-server repo already cloned"
fi
```

## Step 7: Run the Ansible playbook

This is the main event. It handles everything else:
- Clones dotfiles (bare repo to `~/.cfg`, checkout to `$HOME`)
- `brew bundle` from Brewfile (all packages, casks, VS Code extensions)
- Zsh + Zim framework
- Git config (user identity, SSH known_hosts)
- macOS defaults (Dock, keyboard, Finder, dark mode, locale, screenshots, menu bar spacing)
- App preferences (Stats, AltTab, Rectangle, Itsycal, HiddenBar)
- Cursor editor settings (symlinked from dotfiles)
- Dotfiles-sync LaunchAgent (weekly auto-backup)

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
ansible-playbook "$HOME/code/personal/home-server/infra/ansible/laptop.yml"
```

If ansible-playbook fails on a specific task, diagnose the error and retry. Common issues:
- SSH key not authorized: user needs to approve the key in 1Password
- brew bundle timeout: re-run, it will pick up where it left off
- dotfiles checkout conflict: check `~/.config-backup` for backed-up files

## Step 8: Post-setup

Tell the user:
1. Open a **new terminal** to pick up the shell config
2. **Log out and back in** for macOS defaults to fully apply (especially menu bar spacing)
3. Sign in to **JetBrains account** in IntelliJ to sync IDE settings
4. The `FIGMA_API_KEY` environment variable needs to be set for the Claude Figma MCP server
5. The dotfiles-sync LaunchAgent will run every Monday at 9am to keep Brewfile and app preferences up to date
