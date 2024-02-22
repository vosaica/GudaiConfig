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
        'junegunn/fzf.vim',
        dependencies = { 'junegunn/fzf' },
    },
    {
        "vimpostor/vim-lumen",
    },
    {
        "tpope/vim-surround",
    },
}
