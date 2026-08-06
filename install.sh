#!/data/data/com.termux/files/usr/bin/bash
set -e

USERNAME="ayobro-hash"
REPO="python-websockify"
REPO_URL="https://${USERNAME}.github.io/${REPO}"
RAW_URL="https://raw.githubusercontent.com/${USERNAME}/${REPO}/main"

echo "=========================================="
echo " Setting up Custom Termux APT Repository"
echo "=========================================="

# 1. Install prerequisites
echo "[+] Installing curl & gnupg..."
pkg install -y curl gnupg

# 2. Add public GPG key
echo "[+] Adding verification key..."
mkdir -p $PREFIX/etc/apt/trusted.gpg.d
curl -fsSL "$RAW_URL/KEY.gpg" | gpg --batch --yes --dearmor -o $PREFIX/etc/apt/trusted.gpg.d/custom-repo.gpg

# 3. Add repository source
echo "[+] Adding source to sources.list.d..."
mkdir -p $PREFIX/etc/apt/sources.list.d
echo "deb $REPO_URL ./" > $PREFIX/etc/apt/sources.list.d/custom-repo.list

# 4. Update APT & install package
echo "[+] Updating APT package list..."
pkg update -y

echo "[+] Installing python-websockify..."
pkg install -y python-websockify

echo ""
echo "=========================================="
echo " SUCCESS: Installation complete!"
echo " Run 'websockify' to start using it."
echo "=========================================="
