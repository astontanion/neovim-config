vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

local which_key = require("which-key")

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

local has_builtin, builtin = pcall(require, "telescope.builtin")

local file_keys = {
	name = "file",
}

if has_builtin then
	file_keys = {
		name = "file",
		s = { builtin.find_files, "find" },
		g = { builtin.git_files, "in git" },
		f = { builtin.live_grep, "fuzzy" }
	}
end

local has_lsp, lsp = pcall(require, "nvim-lspconfig")

local lsp_keys = {
	name = "code",
	a = { vim.lsp.buf.code_action(), "actions" },
	d = { vim.lsp.buf.declaration(), "declaration" },
	g = { vim.lsp.buf.definition(), "definition" },
	i = { vim.lsp.buf.implementation(), "implementation" }
	--r = { vim.lsp.buf.rename(), "rename" }
}

local mappings = {
	w = window_keys,
	f = file_keys,
	c = lsp_keys
}

local options = {
	mode = "n",
	prefix = "<leader>",
	silent = true,
	noremap = true
}

which_key.register(mappings, options)
