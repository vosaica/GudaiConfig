return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        init = function()
            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            require('lualine').setup()
        end
    },
    {
        'vimpostor/vim-lumen'
    }

}
