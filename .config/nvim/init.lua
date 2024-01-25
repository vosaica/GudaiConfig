vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.termguicolors = true

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.g.mapleader = " "

-- key map to emulate <c-[> in vim terminal
vim.api.nvim_set_keymap("t", "<c-[>", [[<c-\><c-n><esc>]], { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
