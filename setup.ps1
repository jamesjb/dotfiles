#
# setup.ps1 --- Set up symlinks for a new Windows system.
#
# Copyright (C) 2023, James Bielman <jamesjb@gmail.com>
# All Rights Reserved.
#

New-Item -ItemType SymbolicLink -Path "$([Environment]::GetFolderPath("LocalApplicationData"))/nvim" -Target "$(Get-Location)/nvim"
New-Item -ItemType Directory -Path "$HOME/.config/wezterm" -Force
New-Item -ItemType SymbolicLink -Path "$HOME/.config/wezterm/wezterm.lua" -Target "$(Get-Location)/wezterm/wezterm.lua"
