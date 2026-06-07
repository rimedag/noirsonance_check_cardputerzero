#!/bin/sh
set -eu

arch="${NOIRSONANCE_CHECK_ARCH:-$(dpkg --print-architecture)}"
case "$arch" in
    amd64|arm64) ;;
    *)
        echo "Unsupported architecture: $arch" >&2
        echo "NoirSonance Check public binary packages are available for amd64 and arm64." >&2
        exit 1
        ;;
esac

asset="noirsonance-check_0.1.0-noirsonance1_${arch}.deb"
repo="${NOIRSONANCE_CHECK_REPO:-rimedag/noirsonance_check_cardputerzero}"
base_url="${NOIRSONANCE_CHECK_BASE_URL:-https://raw.githubusercontent.com/${repo}/main/pool/main/n/noirsonance-check}"
url="${base_url}/${asset}"
tmp_dir="$(mktemp -d)"

cleanup() {
    rm -rf "$tmp_dir"
}
trap cleanup EXIT INT TERM

echo "Downloading ${asset}..."
curl -fL "$url" -o "${tmp_dir}/${asset}"

echo "Installing NoirSonance Check..."
sudo apt install "${tmp_dir}/${asset}"

echo "Done. Launch with: noirsonance-check-desktop, noirsonance-check-cardputerzero, or noirsonance-check"
