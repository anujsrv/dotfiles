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

require("lazy").setup({
    -- FZF and file navigation
    { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
    { "junegunn/fzf.vim" },
    { "preservim/nerdtree" },

    -- Status line
    { "nvim-lualine/lualine.nvim" },
    { "lewis6991/gitsigns.nvim" },

    -- Colorschemes
    { "nanotech/jellybeans.vim" },
    { "ellisonleao/gruvbox.nvim" },
    { "sainnhe/gruvbox-material" },
    { "EdenEast/nightfox.nvim" },
    { "rebelot/kanagawa.nvim" },

    -- Async builds and test suites
    { "tpope/vim-dispatch" },
    { "tpope/vim-fugitive" },
    { "vim-test/vim-test" },

    -- LSP and completion
    { "neovim/nvim-lspconfig" },

    -- Copilot
    { "github/copilot.vim" },
    { "jellydn/CopilotChat.nvim" },

    -- Surround, tags, and misc
    { "tpope/vim-surround" },
    { "preservim/tagbar" },
    { "unblevable/quick-scope" },
    { "moll/vim-bbye" },

    -- Telescope
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.0" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "nvim-treesitter/playground" },

    -- Markdown rendering
    { "MunifTanjim/nui.nvim" },
    { "MeanderingProgrammer/render-markdown.nvim" },

    -- Icons and UI enhancements
    { "nvim-tree/nvim-web-devicons" },
    { "folke/snacks.nvim" },

    -- Avante.nvim
    { "yetone/avante.nvim", branch = "main", build = "make" },
})

