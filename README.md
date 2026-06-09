Reliable AI web UI automation via Playwright CDP.
Supports: ChatGPT, Gemini, Claude. Fully compatible with both **Windows** and **Linux**.

- 📖 **Windows Users**: Check out the [Windows Guide](WINDOWS-GUIDE.md) for quick setup, scripts, and global hotkey integration.
- 🐧 **Linux Users**: See scripts like `symlink-env.sh` and `terminate-xvfb-chromium`.

Clipboard handling:
  - Text  → injected via execCommand / DOM mutation
  - Image → injected via priority chain:
      1. set_input_files() on hidden <input type="file">   (no focus needed)
      2. CDP drag-and-drop onto the editor                 (no focus needed)
      3. JS Clipboard API + Ctrl+V paste                   (needs page focus)

Stability features:
  - Selector fallback chains (test-id → aria → role → heuristic)
  - Content-stability polling instead of brittle button-state checks
  - execCommand + DOM-mutation dual inject for text editors
  - Per-attempt retry with exponential backoff
  - Heuristic editor detection when all known selectors fail