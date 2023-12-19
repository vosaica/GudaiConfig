#!/usr/bin/env pwsh

# Get args, if not provided, prompt for them
if ($args.Length -ge 1) {
    if ($args -contains "--debug") {
        $Debug = $true
    }
    else {
        Write-Output "Usage: Bootstrap.ps1 [--debug]"
        exit
    }
}

# Get Current Directory
$ConfigDir = (Get-Location).Path

function CreateSymbolicLink {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Target
    )

    # join path Current Directory and Target
    $Target = Join-Path $ConfigDir $Target

    if ($Debug) {
        Write-Output "Will be linking: $Path -> $Target"
    }
    else {
        New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force
    }
}

function LinkSSHKeys {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Target
    )

    # Get the file name from the path
    $FileName = Split-Path $Target -Leaf
    $Path = "~/.ssh/$FileName"

    if ($Debug) {
        Write-Output "Will be linking: $Path -> $Target"
    }
    else {
        New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force
    }
}

# Common Files
CreateSymbolicLink "~/.vimrc" ".vimrc"
CreateSymbolicLink "~/.config" ".config"
CreateSymbolicLink "~/.gitconfig" ".gitconfig"

# Windows Files
if ($IsWindows) {
    CreateSymbolicLink "~/Documents/PowerShell" ".config/powershell"
    CreateSymbolicLink "~/Documents/PowerToys" "PowerToys"
    CreateSymbolicLink "$env:LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json" "WindowsTerminal.json"
    LinkSSHKeys "G:/My Drive/Backups/sshkeys/id_homoantiquum.pub"
    LinkSSHKeys "G:/My Drive/Backups/sshkeys/id_homoantiquum"
}

# Mac Files
if ($IsMacOS){
    LinkSSHKeys "~/Google Drive/My Drive/Backups/sshkeys/id_homoantiquum.pub"
    LinkSSHKeys "~/Google Drive/My Drive/Backups/sshkeys/id_homoantiquum"
}
