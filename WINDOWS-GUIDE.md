# BrowserAgent: Windows Setup & Usage Guide

This guide explains how to configure, run, and use **BrowserAgent** on Windows. 

The tool runs in the background, reads your clipboard (supporting both text prompts and images), sends it to your selected AI web UI tab (ChatGPT, Gemini, or Claude) in a headless browser, waits for the response, copies the response back to your clipboard, and automatically pastes it into your active window.

---

## 📋 Prerequisites

Before setting up, ensure you have the following installed on your system:
1. **Python 3.10+**: Make sure Python is added to your Windows PATH during installation.
2. **Google Chrome** or **Microsoft Edge**: Used to connect to the AI interfaces.

---

## ⚙️ Setup and Installation

### 1. Install Dependencies
Open your command prompt or PowerShell in the project directory and run:
```cmd
pip install -r requirements.txt
```

### 2. Configure Your AI Provider
Create a configuration file named `browser-agent-settings.json` (or the legacy name `env-settings.json`) in your User Home directory (`C:\Users\<Your-Username>\browser-agent-settings.json`).

Add the following JSON configuration:
```json
{
  "model": "chatgpt"
}
```
*Replace `"chatgpt"` with `"gemini"` or `"claude"` depending on your preferred provider.*

### 3. Add to Windows PATH
To run `BrowserAgent` from any command prompt or terminal:
1. Open PowerShell.
2. Run the provided path installer script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\install-path.ps1
   ```
3. Restart any open command prompts or terminals to apply the new PATH variable.

---

## 🚀 How to Use

### 1. First-Time Run (Login Setup)
Because ChatGPT, Gemini, and Claude use bot-protection (like Cloudflare Turnstile) and require authentication, you must log in once using headful mode:
1. Run `browser-agent --login` (or `BrowserAgent --login`) in your command prompt:
   ```cmd
   browser-agent --login
   ```
2. A Chrome/Edge window will open with a dedicated profile (`browser-agent-chrome-profile`). Any existing login session from the legacy profile will be migrated automatically.
3. **Log in manually** to your selected AI provider (ChatGPT, Gemini, or Claude).
4. Once logged in, you can close the Chrome/Edge window or press `Ctrl+C` to terminate the process.

### 2. Daily Workflow (Headless/Hidden)
After the first login, Chrome will run completely in the background without opening any visible window:
1. Copy a prompt or take a screenshot to your clipboard.
2. Run `browser-agent` (or `BrowserAgent`):
   ```cmd
   browser-agent
   ```
3. The script will automatically launch/connect to the debugging browser in headless mode in the background, send the query, copy the response to your clipboard, and simulate `Ctrl+V` to paste the response instantly into your active text editor!

---

## ⌨️ Integrating with Global Hotkeys (Recommended)

To make this tool feel like a native operating system feature, you can bind it to a keyboard shortcut.

### Option A: Using AutoHotkey (Highly Recommended)
[AutoHotkey](https://www.autohotkey.com/) is a lightweight scripting language for Windows hotkeys.

1. Install AutoHotkey (v1.1 or v2).
2. Create a script file named `browser-agent.ahk` anywhere on your computer:
   ```autohotkey
   ; Win + G runs browser-agent in the background (hidden window)
   #g::
   Run, browser-agent, , Hide
   return
   ```
3. Double-click the `.ahk` file to run it. 
4. Now, simply highlight any text, press `Ctrl+C` to copy, press `Win+G`, and wait. The AI response will paste itself directly where your cursor is!

---

## 🧹 Teardown

If you ever need to close the background debugging browser instance, run the helper batch script:
```cmd
terminate-chrome-debug
```
This script automatically scans for processes listening on port `9222` and terminates them cleanly.
