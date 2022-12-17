vim.keymap.set("n", "<leader>ex", "<cmd>Ex<CR>") -- <CR> carriage return

-- move stuff in highlight mode (like in vscode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor in the middle while half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep the cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>P", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y", {noremap = false})

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

