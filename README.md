# WSL2/Ubuntu Env Setup

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

## 3. **Download and run setup script**

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

## 4. (Optional) **Setup Windows11 --> WSL2 Port Forwarding**

- Download Windows-WSL2 port forwarding script (powershell) `win11-to-wsl2-port-forward.ps1` from https://raw.githubusercontent.com/WillNeve/setup/refs/heads/main/win11-to-wsl2-port-forward.ps1

### Setup up task to run this script on system logon

- Press <kbd>⊞</kbd> (windows button)
- Search for and open `Task Scheduler`
- On the Actions bar (right) press `Create Task...`
- In the *Create Task* Window:
  - (General) Name the task (ex: `WSL2 Auto Port Forwarding`)
  - (Triggers) `New...` --> `Begin the task:` --> `at logon` --> `OK`
  - (Actions) `New...` --> `Action: Start a Program` --> `Program/Script: Browse:` (find and open downloading script)  --> `OK`
  - Once complete press `OK` on the main window close the complete the task creation

_After creation, you can run the task manually by finding it in the list and right clicking --> `Run`_
