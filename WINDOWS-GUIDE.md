# Headless-GPT: Windows Setup & Usage Guide

This guide explains how to configure, run, and use **headless-gpt** on Windows. 

The tool runs in the background, reads your clipboard (supporting both text prompts and images), sends it to your selected AI web UI tab (ChatGPT, Gemini, or Claude), waits for the response, copies the response back to your clipboard, and automatically pastes it into your active window.

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
Create a configuration file named `env-settings.json` in your User Home directory (`C:\Users\<Your-Username>\env-settings.json`).

Add the following JSON configuration:
```json
{
  "model": "chatgpt"
}
```
*Replace `"chatgpt"` with `"gemini"` or `"claude"` depending on your preferred provider.*

### 3. Add to Windows PATH
To run `headless-gpt` from any command prompt or terminal:
1. Open PowerShell as an administrator or regular user.
2. Run the provided path installer script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\install-path.ps1
   ```
3. Restart any open command prompts or terminals to apply the new PATH variable.

---

## 🚀 How to Use

### 1. First-Time Run (Login)
Because ChatGPT, Gemini, and Claude use bot-protection (like Cloudflare Turnstile) and require authentication, you must log in once:
1. Copy any text to your clipboard (`Ctrl+C`).
2. Run `headless-gpt` in your command prompt:
   ```cmd
   headless-gpt
   ```
3. A Chrome/Edge window will open with a dedicated profile (`headless-gpt-chrome-profile`).
4. **Log in manually** to your selected AI provider (ChatGPT, Gemini, or Claude).
5. Once logged in, the script will detect the editor, paste your clipboard, and get the response.

### 2. Daily Workflow
After the first login, you do not need to keep Chrome open or log in again. 
1. Copy a prompt or take a screenshot to your clipboard.
2. Trigger `headless-gpt`.
3. The script will automatically launch/connect to the debugging browser in the background, send the query, copy the response to your clipboard, and simulate `Ctrl+V` to paste the response instantly into your active text editor!

---

## ⌨️ Integrating with Global Hotkeys (Recommended)

To make this tool feel like a native operating system feature, you can bind it to a keyboard shortcut.

### Option A: Using AutoHotkey (Highly Recommended)
[AutoHotkey](https://www.autohotkey.com/) is a lightweight scripting language for Windows hotkeys.

1. Install AutoHotkey (v1.1 or v2).
2. Create a script file named `headless-gpt.ahk` anywhere on your computer:
   ```autohotkey
   ; Win + G runs headless-gpt in the background (hidden window)
   #g::
   Run, headless-gpt, , Hide
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
