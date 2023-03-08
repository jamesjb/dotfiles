--
-- keymaps.lua --- Neovim key bindings.
--
-- Copyright (C) 2023, James Bielman <jamesjb@gmail.com>
-- All Rights Reserved.
--

-- Options and shorthand function for setting keybindings.
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Use ',' for the leader and '\' for the local leader key.
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Bind 'jk' to exit insert mode like Escape.
keymap("i", "jk", "<ESC>", opts)

-- Key bindings for working with buffers.
keymap("n", "<Leader>d", ":bd<CR>", opts)
keymap("n", "<Leader>e", ":Lexplore 30<CR>", opts)
keymap("n", "<Leader>b", ":Telescope buffers<CR>", opts)

-- Map 'Control-P' to find files with Telescope.
keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", opts)

-- temporary bindings for compiling and running stuff
keymap("n", "<LocalLeader>c", ":!invoke config<CR>", opts)
keymap("n", "<LocalLeader>b", ":!invoke build<CR>", opts)
keymap("n", "<LocalLeader>r", ":!invoke run<CR>", opts)
