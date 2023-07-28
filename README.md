# [Carbonyl Browser](https://github.com/fathyb/carbonyl) ❤️ [Windows Terminal](https://github.com/microsoft/terminal)

![Carbonyl Terminal](https://github.com/niutech/carbonyl-terminal/assets/384997/88bb7289-1d34-4664-b574-5f1707549fba)

Carbonyl Terminal is the portable Windows Terminal distribution preconfigured to use Carbonyl browser in the Docker container in the cloud, to accelerate web browsing on slow networks.

**Windows Terminal** ⟵ssh/mosh⟶ **Carbonyl Docker container** ⟵https⟶ **Internet**

Carbonyl Terminal uses [mosh](https://mosh.org/) for better responsiveness, with SSH as a fallback.

You can install Carbonyl Terminal Docker conatiner on your VPS in the cloud or use the preconfigured demo server.

### Installation

First, run the Docker container with Carbonyl Terminal on your cloud VPS, e.g. yourserver.com:

```
git clone https://github.com/niutech/carbonyl-terminal
cd carbonyl-terminal
docker build -t carbonyl-terminal .
docker run -d -p 2222:22 -p 60000-60100:60000-60100/udp --name carbonyl carbonyl-terminal
```

The server with Carbonyl Terminal Docker container must have open TCP port 2222 for SSH and UDP ports 60000-60100 for mosh.

### Usage

On your Windows client: [download](https://github.com/niutech/carbonyl-terminal/releases) the latest release of Carbonyl Terminal, extract it and modify the `USER_HOST` variable to `carbonyl@yourserver.com` in `carbonyl.bat` or leave it as is to use the demo server. Then run `WindowsTerminal.exe`, which automatically connects to your Carbonyl instance by running `carbonyl.bat` on startup.

On your Linux or MacOS client: download the `carbonyl.sh` and `carbonyl_rsa` file from the repo, modify the `USER_HOST` variable to `carbonyl@yourserver.com` in `carbonyl.sh` or leave it as is to use the demo server, copy the `carbonyl_rsa` key to `~/.ssh/`, set its permissions to `600` and run `carbonyl.sh` in your terminal emulator of choice.

If you want to use mosh, you have to first install it using WSL (on Windows) or Bash (on Linux/MacOS), copy the `carbonyl_rsa` auth key to `~/.ssh/` and set the appropriate permissions:

```
sudo apt update && sudo apt install -y mosh
cp carbonyl_rsa ~/.ssh/ && chmod 600 ~/.ssh/carbonyl_rsa
```

### License

© 2023 Jerzy Głowacki under MIT License.
