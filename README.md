# WSL2/Ubuntu Env Setup

## 1. **Install WSL (Windows Subsystem for Linux)**

- Open PowerShell as an administrator and run:

  ```bash
  wsl --install
  ```
  _this will also install Ubuntu Linux Distribution as default_
  - on Windows terminal, open an Ubuntu window to complete the installation
  - _System restart will likely be needed after this_

## 3. **Install Visual Studio Code (VSCode)**

- Download the VSCode installer from [here](https://code.visualstudio.com/) and install it on your Windows system.
- During installation, ensure you tick the box for **Add to PATH**.

## 4. **Download and run setup script**

```bash
bash <(wget -qO- https://raw.githubusercontent.com/WillNeve/setup/refs/heads/main/setup.sh)
```

- If you are not me feel free to instead download the script and inspect it 👀:

  ```bash
  wget -O the-setup-script.sh https://raw.githubusercontent.com/WillNeve/setup/refs/heads/main/setup.sh
  echo " - - - - - -  v SETUP SCRIPT v - - - - - -"
  cat the-setup-script.sh
  echo " - - - - - -  ^ SETUP SCRIPT ^ - - - - - -"
  rm the-setup-script.sh
  ```

## 5. (Optional) **Setup Windows11 --> WSL2 Port Forwarding**

_In powershell_

```ps1
win11-to-wsl2-port-forward.ps1
```
