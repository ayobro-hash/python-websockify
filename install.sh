#!/data/data/com.termux/files/usr/bin/bash
set -e

USERNAME="ayobro-hash"
REPO="python-websockify"
DEB_NAME="python-websockify_0.8.0_aarch64.deb"

# Permanent download URL pointing to the latest release asset
DOWNLOAD_URL="https://github.com/${USERNAME}/${REPO}/releases/latest/download/${DEB_NAME}"

echo "=========================================="
echo " Installing python-websockify"
echo "=========================================="

# -L is required because GitHub redirects release downloads to AWS CDN
echo "[+] Downloading package from GitHub Releases..."
curl -fsSL -L -O "$DOWNLOAD_URL"

echo "[+] Installing package..."
pkg install -y ./"$DEB_NAME"

echo "[+] Cleaning up installer file..."
rm -f ./"$DEB_NAME"

echo ""
echo "=========================================="
echo " SUCCESS: Installation complete!"
echo " Run 'websockify' to start using it."
echo "=========================================="
