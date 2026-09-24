-- https://github.com/wbthomason/packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- LSP Support
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lua')

    -- Snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')

    -- https://github.com/crate-ci/typos
    use('poljar/typos.nvim')

    -- Highlight, edit, and navigate code
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate",
        branch = 'main'
    })
    use("romgrk/nvim-treesitter-context")

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Others
    use("mbbill/undotree")
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Git related plugins
    use("tpope/vim-fugitive")

    -- Formatting
    use("sbdchd/neoformat")

    -- Colorschemes
    use("luisiacc/gruvbox-baby")
    use("folke/tokyonight.nvim")

    use({ -- Fancier statusline
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Games
    use("ThePrimeagen/vim-be-good")

    -- Debugging
    -- use("mfussenegger/nvim-dap")

    -- use("simrat39/rust-tools.nvim")
    -- use("nvim-lua/popup.nvim")

    use({"shortcuts/no-neck-pain.nvim", tag = "*"})
end)
