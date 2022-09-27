-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1
vim.opt.background = "dark"
require("tokyonight").setup({
    transparent = true,
    transparent_sidebar = true,
})

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight-night]]
