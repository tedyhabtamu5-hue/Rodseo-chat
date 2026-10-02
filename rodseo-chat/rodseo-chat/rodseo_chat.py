#!/usr/bin/env python3
"""rodseo chat launcher: serves the app on this computer only and opens it in your browser."""
import http.server, os, socket, sys, threading, webbrowser

PORT = int(os.environ.get("RODSEO_PORT", "8787"))
HERE = os.path.dirname(os.path.abspath(__file__))
URL = f"http://localhost:{PORT}"

with socket.socket() as s:
    if s.connect_ex(("127.0.0.1", PORT)) == 0:   # already running: just open it
        webbrowser.open(URL)
        sys.exit(0)

os.chdir(HERE)

class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, *args):
        pass

try:
    server = http.server.ThreadingHTTPServer(("127.0.0.1", PORT), Handler)
except OSError as e:
    sys.exit(f"Could not start on port {PORT}: {e}\nTry: RODSEO_PORT=8800 python3 rodseo.py")

print(f"rodseo chat is running at {URL}  (press Ctrl+C to stop)")
threading.Timer(0.6, lambda: webbrowser.open(URL)).start()
try:
    server.serve_forever()
except KeyboardInterrupt:
    print("\nStopped.")
