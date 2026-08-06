## 🛠️ Installation

### Method 1: Automatic One-Line Setup (Recommended)

Run this single command in Termux to trust the repository key, add the repository source, update package lists, and install `python-websockify`:

```bash
curl -fsSL https://raw.githubusercontent.com/ayobro-hash/python-websockify/refs/heads/main/Release.gpg | gpg --dearmor -o $PREFIX/etc/apt/trusted.gpg.d/custom-repo.gpg && echo "deb https://github.com/ayobro-hash/python-websockify/blob/main/Release.gpg ./" > $PREFIX/etc/apt/sources.list.d/custom-repo.list && pkg update && pkg install -y python-websockify
