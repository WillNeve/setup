# WSL2/Ubuntu Env Setup

## 1. **Install WSL (Windows Subsystem for Linux)**

- Open PowerShell as an administrator and run:

  ```bash
  wsl --install
  ```

- Restart will likely be needed

## 2. **Install Ubuntu**

- After WSL is installed, set your preferred Linux distribution by running:

  ```bash
  wsl --list --online
  ```

- Select `Ubuntu` from the list, and install it using:

  ```bash
  wsl --install -d Ubuntu
  ```

- Launch Ubuntu by searching for "Ubuntu" in your Start menu. Follow the on-screen prompts to set up a username and password for your Linux environment.

## 3. **Install Visual Studio Code (VSCode)**

- Download the VSCode installer from [here](https://code.visualstudio.com/) and install it on your Windows system.
- During installation, ensure you tick the box for **Add to PATH**.

## 4. **Install Node.js**

- Update your package list and install Node.js:

  ```bash
  sudo apt update
  sudo apt install nodejs
  ```

## 5. **Install npm**

- Install npm (Node Package Manager) if it wasn’t included with Node.js:

  ```bash
  sudo apt install npm
  ```

## 6. **Install NVM (Node Version Manager)**

- Use NVM to manage multiple Node.js versions. Install it with the following command:

  ```bash
  curl -o- <https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh> | bash
  ```

## 7. **Install PostgreSQL**

- Install PostgreSQL database server:

  ```bash
  sudo apt install postgresql
  ```

- Permit passwordless sudo for PostgreSQL commands:

- Add the following line to `/etc/sudoers.d/postgresql` to allow passwordless execution of PostgreSQL commands for your user:

  ```bash
  willneve ALL=(ALL) NOPASSWD: /etc/init.d/postgresql

  ```

- Replace `willneve` with your username if different.

## 8. **Install GitHub CLI (gh)**

```bash
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \\
&& sudo mkdir -p -m 755 /etc/apt/keyrings \\
&& wget -qO- <https://cli.github.com/packages/githubcli-archive-keyring.gpg> | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \\
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \\
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] <https://cli.github.com/packages> stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \\
&& sudo apt update \\
&& sudo apt install gh -y
```

## 9. **Install Zsh and Set as Default Shell**

- Install Zsh:

  ```bash
  sudo apt install zsh -y
  ```

- Set Zsh as the default shell:

  ```bash
  chsh -s $(which zsh)
  ```

## 10. **Install Oh My Zsh**

- Install Oh My Zsh to enhance your Zsh shell with themes and plugins:

  ```bash
  sh -c "$(wget <https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh> -O -)"
  ```

## 11. **Create SSH Key**

```bash
ssh-keygen -t ed25519 -C "williamneve6000@gmail.com" -f "~/.ssh/main"
ssh-add ~/.ssh/main
```

## 12. **Add SSH (⚠️ _Public_ ⚠️) Key to GitHub**

- Copy the SSH public key to your clipboard:

  ```bash
  cat ~/.ssh/main.pub
  ```

- Log in to your GitHub account, navigate to **Settings** > **SSH and GPG keys** > **New SSH key**.
- Paste the SSH key into the "Key" field and give it a suitable title, then click **Add SSH key**.

## 13. **Install Redis and Setup Redis**

```bash
sudo apt-get update
sudo apt-get install redis
```

Redis should automatically start, including on reboots, to check if its running try:

```bash
redis-cli ping # returns 'PONG' if server running
```

## 13. **Clone and Setup Dotfiles**

```bash
git clone http://github.com/willneve/dotfiles ~/dotfiles
zsh ~/dotfiles/setup.sh
```

##
