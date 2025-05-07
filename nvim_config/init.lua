vim.cmd("set ruler")
vim.cmd("set nocompatible")
vim.cmd("set showmatch")
vim.cmd("set ignorecase")
vim.cmd("set mouse=v")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set number")
vim.cmd("set wildmode=longest,list")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
vim.cmd("set mouse=a")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("filetype plugin on")
vim.cmd("set ttyfast")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins =  {
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"neovim/nvim-lspconfig"}
}


require("lazy").setup(plugins, opts)

require('github-theme').setup()
vim.cmd("colorscheme github_light")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<C-n>', ":Neotree<CR>")

local treesitter_configs = require("nvim-treesitter.configs")
treesitter_configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "python"},
    highlight = { enable = true },
    indent = { enable = true },  
})

local mason_configs = require("mason").setup()
local mason_lsp_configs = require("mason-lspconfig")
mason_lsp_configs.setup({
    ensure_installed = { "lua_ls", "pylsp", "vimls", "clangd" }
})


local lspconfig = require('lspconfig')
-- lspconfig.lua_ls.setup({})
-- lspconfig.pylsp.setup({})
