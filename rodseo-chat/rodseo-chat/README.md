# rodseo chat

Your AI texts you first. Pick Claude, ChatGPT or Gemini, set a timer, and rodseo chat has it write to you on your schedule.

## Install on Kali / Linux / macOS
```bash
git clone https://github.com/YOUR-USERNAME/rodseo-chat.git
cd rodseo-chat
./install.sh
rodseo-chat
```
`rodseo-chat` starts the app and opens it in your browser. Stop it with `rodseo-chat stop`. Remove it with `./uninstall.sh`.
On Linux it also adds a "rodseo chat" entry to your app menu. Install as a normal user, not root.

## Windows
Install Python 3 from python.org, then double-click `rodseo-chat.bat`.

## No install (any system with Python 3)
```bash
python3 rodseo_chat.py
```

## Get an API key
- Claude: console.anthropic.com
- ChatGPT: platform.openai.com
- Gemini: aistudio.google.com/apikey

Paste the key into the app, choose how often, and press Start. Keep the tab open while it runs.

## Privacy
rodseo chat runs only on your own computer (127.0.0.1). Your key, settings and chat stay in your browser and go only to the AI service you pick. It has no servers.

## Third-party services
rodseo chat uses third-party AI services (Anthropic, OpenAI, Google) with your own key. Their terms, pricing and privacy policies apply. It is not affiliated with or endorsed by them.

Developed by Yosef Habtamu. (c) 2026 Yosef Habtamu. All rights reserved.
