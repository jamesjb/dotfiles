--
-- wezterm.lua --- Cross-platform wezterm configuration.
--
-- Copyright (C) 2023, James Bielman <jamesjb@gmail.com>
-- All Rights Reserved.
--

local wezterm = require("wezterm")

-- Default configuration for all OSes.
local config = {
    font_size = 14,
    color_scheme = "OneHalfDark",
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    unix_domains = {},
}

-- Use Powershell by default on Windows.
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { "powershell" }
end

-- Check for machine-specific Wezterm configuration. If the
-- "wezterm_local.lua" file exists, it must return a function
-- that modifies the configuration table in-place.
local ok, fn = pcall(require, "wezterm_local")
if ok then
    fn(config)
end

return config
