return {
    {
        "willothy/flatten.nvim",
        lazy = false,
        priority = 1001,
        opts = {
            window = {
                open = "alternate",
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            { "s", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x", "o" }, },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            options = {
                icons_enabled = false,
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {},
            },
        },
        opts = {
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end
            },
        },
    },
    {
        "folke/neodev.nvim",
        opts = {},
    },
    {
        "chrisgrieser/nvim-spider",
        keys = {
            { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Move to start of subword", },
            { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Move to end of word", },
            { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Move to start of word", }
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Grep", },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers", },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help tags", },
            { "<leader>fc", "<cmd>Telescope commands<cr>",   desc = "Commands", },
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                }
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        opts = {
            open_mapping = [[<c-\>]],
            -- use pwsh as default shell
            shell = "pwsh",
            direction = "float",
            float_opts = {
                border = 'curved',
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            terminal_colors = false,
        },
        init = function()
            vim.cmd [[colorscheme tokyonight]]
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        keys = {
            { "<cr>", desc = "Increment selection", },
            { "<bs>", desc = "Decrement selection", mode = "x" },
        },
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree", },
        },
        opts = {},
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
