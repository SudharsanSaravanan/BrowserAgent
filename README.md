# BrowserAgent

Reliable AI web UI automation via Playwright CDP.
Supports: ChatGPT, Gemini, Claude. Fully compatible with both **Windows** and **Linux**.

Runs headlessly in the background by default on both Windows and Linux, so no Chrome browser tabs/windows interrupt your workflow.

- 📖 **Windows Users**: Check out the [Windows Guide](WINDOWS-GUIDE.md) for quick setup, scripts, and global hotkey integration.
- 🐧 **Linux Users**: See scripts like `symlink-env.sh` and `terminate-xvfb-chromium`.

## Features
- **Headless Mode by Default**: No browser window steals your focus or stays open while running.
- **Login Mode**: Run with `--login` / `--headful` to easily open a visible browser and authenticate.
- **Session Migration**: Automatically migrates existing login sessions from legacy setups.
- **Clipboard Handling**:
  - Text  → injected via execCommand / DOM mutation
  - Image → injected via priority chain:
      1. `set_input_files()` on hidden `<input type="file">` (no focus needed)
      2. CDP drag-and-drop onto the editor (no focus needed)
      3. JS Clipboard API + Ctrl+V paste (needs page focus)
- **Robustness & Stability**:
  - Selector fallback chains (test-id → aria → role → heuristic)
  - Content-stability polling instead of brittle button-state checks
  - Dual injection for text editors
  - Exponential backoff retry mechanism
  - Heuristic editor detection when all standard selectors fail