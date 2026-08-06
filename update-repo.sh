#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[+] Installing required indexing tools..."
pkg install -y apt-utils dpkg gnupg

echo "[+] Generating Packages index..."
dpkg-scanpackages . /dev/null > Packages
gzip -k -f Packages

echo "[+] Generating Release manifest..."
apt-ftparchive release . > Release

echo "[+] Fetching GPG Key ID..."
KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep -E 'sec' | tail -n 1 | awk '{print $2}' | cut -d'/' -f2)

if [ -z "$KEY_ID" ]; then
    echo "[!] Error: No secret GPG key found. Please generate one first using 'gpg --full-generate-key'."
    exit 1
fi

echo "[+] Signing Release files..."
gpg --batch --yes --default-key "$KEY_ID" -abs -o Release.gpg Release
gpg --batch --yes --default-key "$KEY_ID" --clearsign -o InRelease Release

echo "[+] Exporting public GPG key..."
gpg --batch --yes --armor --export "$KEY_ID" > KEY.gpg

echo "[+] Creating .nojekyll file..."
touch .nojekyll

echo "[+] Committing and pushing repository to GitHub..."
git add Packages Packages.gz Release Release.gpg InRelease KEY.gpg .nojekyll *.deb
git commit -m "Update APT repository indexes and signatures" || true
git push origin main

echo ""
echo "=========================================="
echo " APT Repository successfully published!"
echo "=========================================="
