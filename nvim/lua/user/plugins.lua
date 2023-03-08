--
-- plugins.lua --- Neovim plugin loading.
--
-- Copyright (C) 2023, James Bielman <jamesjb@gmail.com>
-- All Rights Reserved.
--

vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "navarasu/onedark.nvim"

    use {
        "nvim-telescope/telescope.nvim",
        { tag = "0.1.1" },
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

-- treesitter configuration
require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "cpp", "lua", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    },
}

-- lualine configuration
require("lualine").setup {
    options = {
        theme = "onedark",
    },
}
