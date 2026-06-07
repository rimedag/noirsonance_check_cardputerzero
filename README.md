# NoirSonance Check

Local WAV analysis utility for Cardputer Zero.

This public repository contains install instructions and binary package downloads. The development source lives in the private/local NoirSonance Gitea repository.

## Install

Use the install helper:

```bash
curl -fsSL https://raw.githubusercontent.com/rimedag/noirsonance_check_cardputerzero/main/install.sh | sh
```

Or download the package for your machine:

```bash
ARCH="$(dpkg --print-architecture)"
curl -LO "https://raw.githubusercontent.com/rimedag/noirsonance_check_cardputerzero/main/pool/main/n/noirsonance-check/noirsonance-check_0.1.0-noirsonance1_${ARCH}.deb"
sudo apt install "./noirsonance-check_0.1.0-noirsonance1_${ARCH}.deb"
```

## Launch

Cardputer Zero / small display:

```bash
noirsonance-check-cardputerzero
```

Regular Linux desktop or Raspberry Pi HDMI desktop:

```bash
noirsonance-check-desktop
```

Automatic mode:

```bash
noirsonance-check
```

## Packages

Public downloads are architecture-specific binary builds:

- `amd64` for regular Linux desktops and laptops.
- `arm64` for Cardputer Zero and 64-bit Raspberry Pi OS.

The public `.deb` files do not contain the app's readable Python source files.
