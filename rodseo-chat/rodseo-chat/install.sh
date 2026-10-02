#!/usr/bin/env bash
# rodseo chat installer for Kali / Debian / Ubuntu / other Linux and macOS
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
DIR="$HOME/.local/share/rodseo-chat"
BIN="$HOME/.local/bin"

command -v python3 >/dev/null || { echo "python3 is required. On Kali: sudo apt install python3"; exit 1; }
[ "$(id -u)" = "0" ] && echo "Note: you are root. Browsers often refuse to run as root, so install as a normal user."

mkdir -p "$DIR" "$BIN"
cp -r "$SRC/index.html" "$SRC/rodseo_chat.py" "$SRC/assets" "$DIR/"

cat > "$BIN/rodseo-chat" <<EOF
#!/usr/bin/env bash
if [ "\$1" = "stop" ]; then pkill -f "$DIR/rodseo_chat.py" && echo "rodseo chat stopped." || echo "rodseo chat is not running."; exit 0; fi
exec python3 "$DIR/rodseo_chat.py"
EOF
chmod +x "$BIN/rodseo-chat"

if [ "$(uname)" = "Linux" ]; then
  mkdir -p "$HOME/.local/share/applications"
  cat > "$HOME/.local/share/applications/rodseo-chat.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=rodseo chat
Comment=Your AI texts you first
Exec=$BIN/rodseo
Icon=$DIR/assets/icon.png
Terminal=false
Categories=Network;Utility;
EOF
fi

case ":$PATH:" in
  *":$BIN:"*) ;;
  *) for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
       [ -f "$rc" ] && ! grep -q '.local/bin' "$rc" && echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
     done
     echo "Open a new terminal (or run: export PATH=\"\$HOME/.local/bin:\$PATH\") so the 'rodseo-chat' command works." ;;
esac

echo "Installed. Start it with: rodseo-chat   (stop with: rodseo-chat stop)"
