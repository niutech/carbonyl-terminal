# Carbonyl ❤️ Terminal

![Carbonyl Terminal on Windows](https://github.com/niutech/carbonyl-terminal/assets/384997/88bb7289-1d34-4664-b574-5f1707549fba)

Carbonyl Terminal is a lightweight cross-platform client for [Carbonyl](https://github.com/fathyb/carbonyl) browser in the Docker container in the cloud, used to accelerate web browsing on slow network connections or low memory devices. It works in any terminal emulator on Linux/MacOS/UNIX, as well as Windows Terminal.

**Carbonyl Terminal** ⟵ssh/mosh⟶ **Carbonyl Terminal Docker Container** ⟵https⟶ **Internet**

Carbonyl Terminal uses [mosh](https://mosh.org/) for better responsiveness, with compressed SSH as a fallback. It also provides tabs using tmux.

Carbonyl Terminal Docker Container bundles Carbonyl browser, tmux, mosh and SSH server with public key authentication.

You can install Carbonyl Terminal Docker Conatiner on your VPS in the cloud or use the preconfigured demo server (only for testing).

## Installation

First, run Carbonyl Terminal Docker Container on your cloud VPS, e.g. yourserver.com:

```sh
git clone https://github.com/niutech/carbonyl-terminal
cd carbonyl-terminal/docker/
docker compose up
# OR:
docker build -t carbonyl-terminal .
docker run -d -p 2222:22 -p 60000-60100:60000-60100/udp --dns 94.140.14.14 --dns 94.140.15.15 --name carbonyl carbonyl-terminal
```

The server with Carbonyl Terminal Docker Container must have open TCP port 2222 for SSH and UDP ports 60000-60100 for mosh. It also uses [AdGuard DNS](https://adguard-dns.io/en/public-dns.html) for blocking ads and trackers.

## Usage

#### NEW: Web client

You can try the [**Carbonyl Terminal web client demo**](https://niutech.github.io/carbonyl-terminal/) using [ttyd](https://github.com/tsl0922/ttyd) with 15 minutes of time limit per session. Keep in mind that the web client requires more bandwidth than the mosh/ssh client because it does not use efficient compression unlike mosh/ssh.

#### Windows client

On Windows, you can use Carbonyl Terminal using the provided [PuTTY Portable](https://portableapps.com/apps/internet/putty_portable) distribution preconfigured to connect to Carbonyl Terminal Docker container. [Download](https://github.com/niutech/carbonyl-terminal/releases) the latest release of Carbonyl Terminal Portable for Windows x86, extract it and run `CarbonylTerminalPortable.exe` to connect to the demo server. If you want to use your own server, close the app, edit the file `Carbonyl Terminal Portable\Data\settings\putty.reg` and replace the value of `"HostName"` to `yourserver.com`, then save it and re-run the app.

Another way is just to download the [`carbonyl.bat`](https://github.com/niutech/carbonyl-terminal/raw/main/carbonyl.bat) script and run it in the command prompt, using the built-in OpenSSH client.

If you want to use mosh on Windows, you have to first install it in [WSL](https://learn.microsoft.com/en-us/windows/wsl/). Don't forget to copy the `carbonyl_rsa` auth key to `~/.ssh/` and set the appropriate permissions:

```sh
sudo apt install mosh
cp carbonyl_rsa ~/.ssh/ && chmod 600 ~/.ssh/carbonyl_rsa
```

#### Linux/MacOS client

On Un*x, just download the [`carbonyl.sh`](https://github.com/niutech/carbonyl-terminal/raw/main/carbonyl.sh) script, modify the `USER_HOST` variable to `carbonyl@yourserver.com` in it or leave it as is to use the demo server. Then set it as executable and run `./carbonyl.sh` in your favorite terminal emulator.

![Carbonyl Terminal on Linux](https://github.com/niutech/carbonyl-terminal/assets/384997/034826e7-81bc-4a22-b1cb-c142239f2c55)


## License

© 2023 Jerzy Głowacki under MIT License.
