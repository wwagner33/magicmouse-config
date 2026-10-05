#!/bin/bash
# Instala a parte privilegiada do Configurador do Magic Mouse.
# Uso: sudo ./install.sh
set -euo pipefail
DIR=$(cd "$(dirname "$0")" && pwd)

[[ $EUID -eq 0 ]] || { echo "Rode com sudo: sudo $0" >&2; exit 1; }

install -D -m 0755 -o root -g root "$DIR/magicmouse-helper" /usr/local/libexec/magicmouse-helper
install -D -m 0644 -o root -g root "$DIR/org.local.magicmouse-config.policy" \
    /usr/share/polkit-1/actions/org.local.magicmouse-config.policy

echo "Auxiliar e política polkit instalados."
echo "Abra pelo menu: Configurações → Magic Mouse (ou rode: magicmouse-config)"
