#!/data/data/com.termux/files/usr/bin/bash
set -e

TAG="v0.8.0"
DEB_NAME="python-websockify_0.8.0_aarch64.deb"
DOWNLOAD_URL="https://github.com/ayobro-hash/python-websockify/releases/download/${TAG}/${DEB_NAME}"

echo "=========================================="
echo " Installing python-websockify (${TAG})"
echo "=========================================="

echo "[+] Downloading package from GitHub Release..."
curl -fsSL -L -o "$DEB_NAME" "$DOWNLOAD_URL"

echo "[+] Installing package via pkg..."
pkg install -y ./"$DEB_NAME"

echo "[+] Cleaning up setup files..."
rm -f ./"$DEB_NAME"

echo ""
echo "=========================================="
echo " SUCCESS: Installation complete!"
echo " Run 'websockify' to start using it."
echo "=========================================="
