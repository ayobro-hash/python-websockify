#!/data/data/com.termux/files/usr/bin/bash
set -e

# Replace with your actual GitHub username
USERNAME="ayobro-hash"

# Raw GitHub URL for key & installer files
RAW_URL="https://raw.githubusercontent.com/${USERNAME}/python-websockify/main"

# GitHub Pages URL for APT package downloads
REPO_URL="https://${USERNAME}.github.io/python-websockify"

echo "=========================================="
echo " Setting up Custom Termux APT Repository"
echo "=========================================="

# 1. Install required packages
echo "[+] Checking required tools (curl, gnupg)..."
pkg install -y curl gnupg

# 2. Download public GPG key directly from raw GitHub
echo "[+] Adding GPG verification key..."
mkdir -p $PREFIX/etc/apt/trusted.gpg.d
curl -fsSL "$RAW_URL/KEY.gpg" | gpg --batch --yes --dearmor -o $PREFIX/etc/apt/trusted.gpg.d/custom-repo.gpg

# 3. Add repository source list
echo "[+] Adding repository source list..."
mkdir -p $PREFIX/etc/apt/sources.list.d
echo "deb $REPO_URL ./" > $PREFIX/etc/apt/sources.list.d/custom-repo.list

# 4. Update package lists and install python-websockify
echo "[+] Updating APT packages..."
pkg update -y

echo "[+] Installing python-websockify..."
pkg install -y python-websockify

echo ""
echo "=========================================="
echo " SUCCESS: Installation complete!"
echo " Run 'websockify' to start using it."
echo "=========================================="
