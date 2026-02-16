#!/bin/bash
set -e

# Bootstrap script for a fresh macOS laptop.
#
# On a fresh machine:
#   curl -fsSL https://gist.githubusercontent.com/mcgizzle/04942da061d62a43b74ec489e2fcd1de/raw/install.sh | bash
#
# Prerequisites: 1Password installed with SSH agent enabled.

OP_AGENT_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
HOME_SERVER_REPO="git@github.com:mcgizzle/home-server.git"
HOME_SERVER_PATH="$HOME/code/personal/home-server"

echo "==> Checking 1Password SSH agent"
if [ ! -S "$OP_AGENT_SOCK" ]; then
  echo "ERROR: 1Password SSH agent socket not found."
  echo "Open 1Password > Settings > Developer > Turn on SSH Agent, then retry."
  exit 1
fi

echo "==> Configuring SSH to use 1Password agent"
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
if [ ! -f "$HOME/.ssh/config" ]; then
  cat > "$HOME/.ssh/config" <<'EOF'
Host *
	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
EOF
  chmod 644 "$HOME/.ssh/config"
fi

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

echo "==> Installing Ansible"
brew install ansible 2>/dev/null || true

echo "==> Cloning home-server repo"
mkdir -p "$(dirname "$HOME_SERVER_PATH")"
if [ ! -d "$HOME_SERVER_PATH" ]; then
  git clone "$HOME_SERVER_REPO" "$HOME_SERVER_PATH"
fi

echo "==> Handing off to Ansible"
ansible-playbook "$HOME_SERVER_PATH/infra/ansible/laptop.yml"

echo ""
echo "Done! Open a new terminal to pick up your shell config."
