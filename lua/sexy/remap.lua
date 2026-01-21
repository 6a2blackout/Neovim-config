vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


-- this is the optional stuff
-- anything after this comment can be removed and you will still have a coconut oil experience
--


vim.opt.guicursor = ""


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "C-d>zz")
vim.keymap.set("n", "<C-u>", "C-u>zz")

vim.keymap.set("n", "<n>", "nzzzv")
vim.keymap.set("n", "<N>", "Nzzzv")


vim.opt.clipboard = ""

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+y$', { desc = 'Copy to EOL to system clipboard' })

vim.keymap.set('v', '<leader>P', '"+p', { desc = 'paste from system clipboard' })
vim.keymap.set('n', '<leader>P', '"+p', { desc = 'paste from system clipboard' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.keymap.set("n", "Q", "<nop>")



vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")







