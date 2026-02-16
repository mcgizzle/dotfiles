#!/bin/bash
set -e

# Bootstrap script for a fresh macOS laptop.
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/mcgizzle/dotfiles/master/install.sh | bash
#
# Prerequisites: sign in to 1Password and enable the SSH agent first.

DOTFILES_REPO="https://github.com/mcgizzle/dotfiles.git"
CFG_DIR="$HOME/.cfg"
HOME_SERVER_REPO="git@github.com:mcgizzle/home-server.git"
HOME_SERVER_PATH="$HOME/code/personal/home-server"
ANSIBLE_DIR="$HOME_SERVER_PATH/infra/ansible"

echo "==> Installing Xcode Command Line Tools"
if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  echo "    Waiting for Xcode CLT install to complete..."
  until xcode-select -p &>/dev/null; do sleep 5; done
fi

echo "==> Installing Homebrew"
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Cloning dotfiles"
if [ ! -d "$CFG_DIR" ]; then
  git clone --bare "$DOTFILES_REPO" "$CFG_DIR"

  # Try checkout, back up conflicts if any
  if ! git --git-dir="$CFG_DIR" --work-tree="$HOME" checkout 2>/dev/null; then
    echo "    Backing up conflicting dotfiles to ~/.config-backup"
    mkdir -p "$HOME/.config-backup"
    git --git-dir="$CFG_DIR" --work-tree="$HOME" checkout 2>&1 \
      | grep -E '^\s+\.' | awk '{print $1}' \
      | xargs -I{} mv "$HOME/{}" "$HOME/.config-backup/"
    git --git-dir="$CFG_DIR" --work-tree="$HOME" checkout
  fi

  git --git-dir="$CFG_DIR" --work-tree="$HOME" config status.showUntrackedFiles no
else
  echo "    Dotfiles already cloned, pulling latest"
  git --git-dir="$CFG_DIR" --work-tree="$HOME" pull
fi

echo "==> Installing from Brewfile"
brew bundle --file="$HOME/Brewfile"

echo "==> Cloning home-server repo"
mkdir -p "$(dirname "$HOME_SERVER_PATH")"
if [ ! -d "$HOME_SERVER_PATH" ]; then
  git clone "$HOME_SERVER_REPO" "$HOME_SERVER_PATH"
fi

echo "==> Installing Ansible"
brew install ansible 2>/dev/null || true

echo "==> Running laptop Ansible playbook"
ansible-playbook "$ANSIBLE_DIR/laptop.yml"

echo ""
echo "Done! Open a new terminal to pick up your shell config."
echo "You may want to review macOS defaults that were applied."
