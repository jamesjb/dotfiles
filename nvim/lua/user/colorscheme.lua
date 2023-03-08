--
-- colorscheme.lua
--
-- Copyright (C) 2023, James Bielman <jamesjb@gmail.com>
-- All Rights Reserved.
--

require("onedark").setup {
    style = "darker",
    code_style = {
        comments = "none",
    },
}

require("onedark").load()

-- Fix incorrect popup colors.
--
-- See: https://vi.stackexchange.com/questions/39078/wrong-colors-in-of-telescope-window
vim.cmd "hi! link NormalFloat Normal"
