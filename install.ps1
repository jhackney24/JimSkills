# Install JimSkills into the current project's .claude\skills\ directory.
# Usage: run from your project root:
#   irm https://raw.githubusercontent.com/jhackney24/JimSkills/main/install.ps1 | iex
$ErrorActionPreference = "Stop"
$repo = "https://github.com/jhackney24/JimSkills.git"
$dest = ".claude\skills"
$tmp  = Join-Path $env:TEMP ("jimskills_" + [guid]::NewGuid().ToString("N"))
try {
    Write-Host "Cloning JimSkills..."
    git clone --depth 1 $repo $tmp | Out-Null
    New-Item -ItemType Directory -Force $dest | Out-Null
    $count = (Get-ChildItem -Directory (Join-Path $tmp "skills")).Count
    Copy-Item -Recurse -Force (Join-Path $tmp "skills\*") "$dest\"
    Write-Host "Installed $count skills into $dest\"
    Write-Host "Start a new Claude Code session to pick them up."
} finally {
    if (Test-Path $tmp) { Remove-Item -Recurse -Force $tmp }
}
