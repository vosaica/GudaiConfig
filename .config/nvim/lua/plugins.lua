return {
    "vimpostor/vim-lumen",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    {
        'junegunn/fzf.vim',
        dependencies = { 'junegunn/fzf' }
    },
    {
        "willothy/flatten.nvim",
        opts = {
            window = { open = "alternate" }
        },
        lazy = false,
        priority = 1001,
    },
    {
        "bkad/CamelCaseMotion",
        init = function()
            vim.g.camelcasemotion_key = "<leader>"
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            terminal_colors = false
        },
        init = function()
            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
            }
        },
        init = function()
            require('lualine').setup()
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function() require("flash").jump() end,
                desc = "Flash"
            },
        },
    }
}
