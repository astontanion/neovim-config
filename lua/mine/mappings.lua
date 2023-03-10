vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

local map = vim.keymap.set

map("n", "j", "v:count ? 'j' : 'gj'", { silent = true, expr = true } )
map("n", "k", "v:count ? 'k' : 'gk'", { silent = true, expr = true })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

local which_key_status, which_key = pcall(require, "which-key")

if not which_key_status then
	return
end

local window_keys = {
	name = "window",
	s = { vim.cmd.split, "split horizontal" },
	v = { vim.cmd.vsplit, "split vertically"},
	n = { vim.cmd.new, "new"},
	c = { vim.cmd.close, "close"},
	b = { "<c-w>=", "balance"},

	K = { "<c-w>K", "split vertically"},
	J = { "<c-w>J", "split vertically"},
	H = { "<c-w>H", "split vertically"},
	L = { "<c-w>L", "split vertically"},

	k = { ":wincmd k<CR>", "split vertically"},
	j = { ":wincmd j<CR>", "split vertically"},
	h = { ":wincmd h<CR>", "split vertically"},
	l = { ":wincmd l<CR>", "split vertically"}
}

local mappings = {
	w = window_keys,
}

local options = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true
}

which_key.register(mappings, options)
