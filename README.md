# Termux APT Repository

A custom GPG-signed APT package repository for Termux providing pre-compiled, native C binaries for maximum performance.

---

## 🛠️ Installation

### Method 1: Automatic One-Line Setup (Recommended)

Run this single command in Termux to trust the repository key, add the repository source, update package lists, and install `python-websockify`:

```bash
curl -fsSL https://<YOUR-USERNAME>.github.io/termux-repo/KEY.gpg | gpg --dearmor -o $PREFIX/etc/apt/trusted.gpg.d/custom-repo.gpg && echo "deb https://<YOUR-USERNAME>.github.io/termux-repo ./" > $PREFIX/etc/apt/sources.list.d/custom-repo.list && pkg update && pkg install -y python-websockify

