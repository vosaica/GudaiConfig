return {
    {
        "vimpostor/vim-lumen"
    },
    {
        "tpope/vim-surround"
    },
    {
        "tpope/vim-commentary"
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
            transparent = true
        },
        init = function()
            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        "nvim-lualine/lualine.nvim",
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
