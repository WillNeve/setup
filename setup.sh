#!/bin/bash
# Exit on error
set -e

# 1. Create SSH Key
read -p "Enter your email address for the SSH key: " email
echo "Creating SSH Key with email: $email"
ssh-keygen -t ed25519 -C "$email" -f "$HOME/.ssh/main"
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/main"

# 2. Print SSH Public Key for GitHub setup
echo "Copy the following SSH public key and add it to GitHub:"
cat "$HOME/.ssh/main.pub"
echo "Navigate to GitHub > Settings > SSH and GPG keys > New SSH key to add the key."
read -p "Press Enter once you have added the SSH key to GitHub..."

# 3. Install Zsh and Set as Default Shell
echo "Installing Zsh and setting it as the default shell..."
sudo apt install -y zsh
chsh -s $(which zsh)

# 4. Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
_Answer <kbd>Y</kbd> to `Do you want to change your default shell to zsh? [Y/n]`_

# 5. Clone and Setup Dotfiles
echo "Cloning and setting up dotfiles..."
git clone git@github.com:willneve/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/setup/setup.sh
zsh ~/dotfiles/setup/setup.sh

# 6. Install Node.js
echo "Updating package list and installing Node.js..."
sudo apt update
sudo apt install -y nodejs

# 7. Install npm (if not included with Node.js)
echo "Installing npm..."
sudo apt install -y npm

# 8. Install NVM (Node Version Manager)
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
echo "export NVM_DIR=\"$HOME/.nvm\"\n[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.zshrc
echo "export NVM_DIR=\"$HOME/.nvm\"\n[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"\n[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\""
# 9. Install PostgreSQL
echo "Installing PostgreSQL..."
sudo apt install -y postgresql
echo "$USER ALL=(ALL) NOPASSWD: /etc/init.d/postgresql" | sudo tee /etc/sudoers.d/postgresql
echo "# Start postgresql local server\nsudo /etc/init.d/postgresql start" >> ~/.zshrc

# 10. Install GitHub CLI (gh)
echo "Installing GitHub CLI (gh)..."
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install -y gh

# 11. Install Redis and setup Redis
echo "Installing Redis..."
sudo apt-get update
sudo apt-get install -y redis

echo "Setup complete! ✅"
