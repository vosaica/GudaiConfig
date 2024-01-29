return {
    {
        "bkad/CamelCaseMotion",
        init = function()
            vim.g.camelcasemotion_key = "<leader>"
        end,
    },
    {
        "tpope/vim-commentary",
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
    },
    {
        'junegunn/fzf.vim',
        dependencies = { 'junegunn/fzf' },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
            }
        },
    },
    {
        "vimpostor/vim-lumen",
    },
    {
        "tpope/vim-surround",
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
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {},
    },
}
