# ⚙️ WSL2/Ubuntu Env Setup

## 1. **Install WSL (Windows Subsystem for Linux)**

- Open PowerShell as an administrator and run:

  ```bash
  wsl --install
  ```
  _this will also install Ubuntu Linux Distribution as default_
  - on Windows terminal, open an Ubuntu window to complete the installation
  - _System restart will likely be needed after this_

## 2. **Install Visual Studio Code (VSCode)**

- Download the VSCode installer from [here](https://code.visualstudio.com/) and install it on your Windows system.
- During installation, ensure you tick the box for **Add to PATH**.
- _You may need to restart shell for PATH addition `code` to take affect_

## 3. **Download and run setup script**

```bash
bash <(wget -qO- https://raw.githubusercontent.com/WillNeve/setup/refs/heads/main/setup.sh)
```

<details>
  <summary>
    If you are not me feel free to instead download the script and inspect it 👀
  </summary>
  
  <br>
  
  ```bash
  wget -O the-setup-script.sh https://raw.githubusercontent.com/WillNeve/setup/refs/heads/main/setup.sh
  echo " - - - - - -  v SETUP SCRIPT v - - - - - -"
  cat the-setup-script.sh
  echo " - - - - - -  ^ SETUP SCRIPT ^ - - - - - -"
  rm the-setup-script.sh
  ```
</details>