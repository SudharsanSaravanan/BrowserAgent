# Get the directory of the current script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get current User PATH
$UserPath = [Environment]::GetEnvironmentVariable("PATH", "User")

# Check if the path is already in the USER path
if ($UserPath -split ';' -contains $ScriptDir) {
    Write-Host "Directory '$ScriptDir' is already in your PATH." -ForegroundColor Green
} else {
    # Add to User PATH
    $NewPath = $UserPath + ";" + $ScriptDir
    # Remove any duplicate semicolons
    $NewPath = $NewPath -replace ';+', ';'
    [Environment]::SetEnvironmentVariable("PATH", $NewPath, "User")
    Write-Host "Successfully added '$ScriptDir' to your User PATH." -ForegroundColor Green
    Write-Host "Please restart your terminal, command prompt, or code editor to apply the changes." -ForegroundColor Yellow
}
