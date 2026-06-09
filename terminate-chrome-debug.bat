@echo off
echo Terminating Chromium/Chrome debug instances on port 9222...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :9222') do (
    taskkill /f /pid %%a 2>nul
)
echo Done.
