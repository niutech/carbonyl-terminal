# [Carbonyl Browser](https://github.com/fathyb/carbonyl) ❤️ [Windows Terminal](https://github.com/microsoft/terminal) / [QTerminal](https://github.com/lxqt/qterminal)

![Carbonyl Terminal on Windows](https://github.com/niutech/carbonyl-terminal/assets/384997/88bb7289-1d34-4664-b574-5f1707549fba)

Carbonyl Terminal is the portable [Windows Terminal](https://github.com/microsoft/terminal) / [QTerminal](https://github.com/lxqt/qterminal) distribution preconfigured to use Carbonyl browser in the Docker container in the cloud in order to accelerate web browsing on a slow network connection.

**Carbonyl Terminal** ⟵ssh/mosh⟶ **Carbonyl Terminal Docker Container** ⟵https⟶ **Internet**

Carbonyl Terminal uses [mosh](https://mosh.org/) for better responsiveness, with compressed SSH as a fallback.

Carbonyl Terminal Docker Container bundles Carbonyl browser, mosh and SSH server with public key authentication.

You can install Carbonyl Terminal Docker Conatiner on your VPS in the cloud or use the preconfigured demo server (limit 15 min, only for testing).

## Installation

First, run Carbonyl Terminal Docker Container on your cloud VPS, e.g. yourserver.com:

```
git clone https://github.com/niutech/carbonyl-terminal
cd carbonyl-terminal
docker build -t carbonyl-terminal .
docker run -d -p 2222:22 -p 60000-60100:60000-60100/udp --dns 94.140.14.14 --dns 94.140.15.15 --name carbonyl carbonyl-terminal
```

The server with Carbonyl Terminal Docker Container must have open TCP port 2222 for SSH and UDP ports 60000-60100 for mosh. It also uses [AdGuard DNS](https://adguard-dns.io/en/public-dns.html) for blocking ads and trackers.

**On your Windows client:** [download](https://github.com/niutech/carbonyl-terminal/releases) the latest release of Carbonyl Terminal, extract it and modify the `USER_HOST` variable to `carbonyl@yourserver.com` in `carbonyl.bat` or leave it as is to use the demo server. Then run `CarbonylTerminal.exe`, which automatically connects to your Carbonyl instance by running `carbonyl.bat` in the new tab.

If you want to use mosh on Windows, you have to first install it in [WSL](https://learn.microsoft.com/en-us/windows/wsl/). Don't forget to copy the `carbonyl_rsa` auth key to `~/.ssh/` and set the appropriate permissions:

```
sudo apt install mosh
cp carbonyl_rsa ~/.ssh/ && chmod 600 ~/.ssh/carbonyl_rsa
```

**On your Linux or MacOS client:** clone the repo to `~/carbonyl-terminal/`, go to `~/carbonyl-terminal/linux/` directory, modify the `USER_HOST` variable to `carbonyl@yourserver.com` in `carbonyl.sh` or leave it as is to use the demo server. Then run `./install.sh` to install qterminal and mosh packages using APT (Ubuntu/Debian), Zypper (OpenSUSE), DNF (Fedora/Red Hat), Pacman (Arch Linux) or Macports (MacOS) and configure them to automatically connect to Carbonyl instance in the new tab. After installation, there should be the`~/.local/share/applications/carbonyl-terminal.desktop` file which adds the Carbonyl Terminal shortcut to the main menu in your desktop environment.

![Carbonyl QTerminal on Linux](https://github.com/niutech/carbonyl-terminal/assets/384997/0b7ffdd0-507f-4d94-af77-350a515c3f14)


## License

© 2023 Jerzy Głowacki under MIT License.
