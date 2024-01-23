#!/usr/bin/env pwsh

# Get args, if not provided, prompt for them
if ($args.Length -ge 1) {
    if ($args -contains "--debug") {
        $Debug = $true
    }
    else {
        Write-Host "Usage: bootstrap.ps1 [--debug]"
        exit
    }
}

function CreateSymbolicLink {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Target,
        [Parameter(Mandatory = $false)]
        [string]$ConfigDir = (Get-Location).Path
    )

    # join path Current Directory and Target
    $Target = Join-Path $ConfigDir $Target

    if ($Debug) {
        Write-Host "Will be linking: $Path -> $Target" -ForegroundColor Green
    }
    else {
        New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force | Out-Null
        Write-Host "Linked $Path -> $Target" -ForegroundColor Green
    }
}

function CopySSHKeys {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Target
    )

    # Get the file name from the path
    $FileName = Split-Path $Target -Leaf
    $Path = "~/.ssh/$FileName"

    if ($Debug) {
        Write-Host "Will be copying: $Target -> $Path" -ForegroundColor Yellow
    }
    else {
        Copy-Item $Target $Path -Force
        Write-Host "Copied $Target -> $Path" -ForegroundColor Yellow
    }
}

# Common Files
Write-Host "Files for all platform:" -ForegroundColor Magenta
CreateSymbolicLink "~/.vimrc" ".vimrc"
CreateSymbolicLink "~/.ideavimrc" ".ideavimrc"
CreateSymbolicLink "~/.config" ".config"
CreateSymbolicLink "~/.gitconfig" ".gitconfig"
CreateSymbolicLink "~/.ssh/config" "SSHConfig"
Write-Host ""

# Windows Files
if ($IsWindows) {
    Write-Host "Files for Windows:" -ForegroundColor Magenta
    CreateSymbolicLink "~/Documents/PowerShell" ".config/powershell"
    CreateSymbolicLink "~/Documents/PowerToys" "PowerToys"
    CreateSymbolicLink "$env:LOCALAPPDATA/nvim" ".config/nvim"
    CreateSymbolicLink "$env:LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json" "WindowsTerminal.json"
    CreateSymbolicLink "$env:LOCALAPPDATA/Microsoft/Windows/Themes/Gudai Dark.theme" "Gudai Dark.theme"
    CreateSymbolicLink "$env:LOCALAPPDATA/Microsoft/Windows/Themes/Gudai Light.theme" "Gudai Light.theme"
    CopySSHKeys "G:/My Drive/Backup/SSHKeys/id_homoantiquum.pub"
    CopySSHKeys "G:/My Drive/Backup/SSHKeys/id_homoantiquum"

    CreateSymbolicLink "~/Documents/美少女万華鏡３" "美少女万華鏡３" "G:/My Drive/Backup"
}

# Mac Files
if ($IsMacOS) {
    Write-Host "Files for Mac:" -ForegroundColor Magenta
    CopySSHKeys "~/Google Drive/My Drive/Backups/SSHKeys/id_homoantiquum.pub"
    CopySSHKeys "~/Google Drive/My Drive/Backups/SSHKeys/id_homoantiquum"
}
