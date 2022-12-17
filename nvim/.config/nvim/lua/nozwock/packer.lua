-- https://github.com/wbthomason/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

    -- FuzzyFinder *
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- TreeSitter *
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")

    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- use("nvim-lua/popup.nvim")

    -- Colorschemes
    use("luisiacc/gruvbox-baby")
    use("folke/tokyonight.nvim")

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- use("simrat39/rust-tools.nvim")

    -- Debugging
    -- use("mfussenegger/nvim-dap")

    -- games
    use("ThePrimeagen/vim-be-good")
end)
