#!/usr/bin/env bash
pkill -f "$HOME/.local/share/rodseo-chat/rodseo_chat.py" 2>/dev/null
rm -rf "$HOME/.local/share/rodseo-chat" "$HOME/.local/bin/rodseo-chat" "$HOME/.local/share/applications/rodseo-chat.desktop"
echo "rodseo chat removed."
