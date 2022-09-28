local Remap = require("nozwock.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>ex", "<cmd>Ex<CR>") -- <CR> carriage return
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- greatest remap ever
xnoremap("<leader>P", "\"_dP")
nnoremap("<leader>p", "\"+p")
vnoremap("<leader>p", "\"+p")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

vnoremap("<leader>d", "\"_d")

inoremap("<C-c>", "<Esc>")

