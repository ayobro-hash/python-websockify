#!/data/data/com.termux/files/usr/bin/bash
set -e

REPO_URL="https://github.com/ayobro-hash/python-websockify"

echo "=========================================="
echo " Setting up Custom Termux APT Repository"
echo "=========================================="

# 1. Install required packages
echo "[+] Checking required tools (curl, gnupg)..."
pkg install -y curl gnupg

# 2. Download and trust public GPG key
echo "[+] Adding GPG verification key..."
curl -fsSL "$REPO_URL/KEY.gpg" | gpg --dearmor -o $PREFIX/etc/apt/trusted.gpg.d/custom-repo.gpg

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
